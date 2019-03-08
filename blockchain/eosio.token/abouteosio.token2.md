# [eosio.token](https://github.com/EOSIO/eosio.contracts/tree/master/eosio.token)에 대한 정밀 분석 part2

## 기타
### stake(스테이크)와 unstake(언스테이크)
EOS를 전송하거나 dApp을 사용하려면 stake(스테이크)를 해야 합니다. stake(스테이크)를 하면 CPU와 NET 자원을 부여받고 BP에게 투표할 수 있는 권한을 받게 됩니다.
stake(스테이크) 된 EOS는 사용이 불가하지만 사라지는 것이 아니라 unskake(언스테이크)했을 때 72시간 후 되돌려 받을 수 있습니다.

### code와 scope
* code는 쓰기 권한이 있는 계정 이름
* scope는 데이터가 저장되는 계정
	* 컨트랙트 데이터를 구분하여 정해진 곳에서만 접근할 수 있도록 합니다.
	* token 컨트랙트는 각 eosio 계정을 계정 table scope로 사용합니다. (모,,,야)

### add_balance와 has_auth
add_balance에서 to와 to_action_end() 가 같으면 ram_payer에게 emplace하게 되어있습니다. 그러므로 transfer에서 has_auth를 검사해 줄 필요가 있습니다.
> (owner와 ram_payer가  다를 수 있어서)
### SEND_INLINE_ACTION

## function
> 궁금할 수 있는 내용이나, 궁금했던 내용을 흐름 중심으로 설명합니다.
### modify
modify 함수는 먼저 반복자가 끝인지 검사를 하고
```c++
      template<typename Lambda>
      void modify( const_iterator itr, name payer, Lambda&& updater ) {
         eosio::check( itr != end(), "cannot pass end iterator to modify" );

         modify( *itr, payer, std::forward<Lambda&&>(updater) );
      }
//https://github.com/EOSIO/eosio.cdt/blob/master/libraries/eosiolib/multi_index.hpp
```
끝이 아니라면 다음 modify 함수로 넘겨 실제 multi_index 내부의 데이터를 수정하는 작업을 합니다.
```c++
 template<typename Lambda>
      void modify( const T& obj, name payer, Lambda&& updater ) {
         using namespace _multi_index_detail;

         const auto& objitem = static_cast<const item&>(obj);
         eosio::check( objitem.__idx == this, "object passed to modify is not in multi_index" );
         auto& mutableitem = const_cast<item&>(objitem);
         eosio::check( _code.value == current_receiver(), "cannot modify objects in table of another contract" ); // Quick fix for mutating db using multi_index that shouldn't allow mutation. Real fix can come in RC2.

         auto secondary_keys = hana::transform( _indices, [&]( auto&& idx ) {
            typedef typename decltype(+hana::at_c<0>(idx))::type index_type;

            return index_type::extract_secondary_key( obj );
         });

         auto pk = obj.primary_key();

         auto& mutableobj = const_cast<T&>(obj); // Do not forget the auto& otherwise it would make a copy and thus not update at all.
         updater( mutableobj );

         eosio::check( pk == obj.primary_key(), "updater cannot change primary key when modifying an object" );

         size_t size = pack_size( obj );
         //using malloc/free here potentially is not exception-safe, although WASM doesn't support exceptions
         void* buffer = max_stack_buffer_size < size ? malloc(size) : alloca(size);

         datastream<char*> ds( (char*)buffer, size );
         ds << obj;

         db_update_i64( objitem.__primary_itr, payer.value, buffer, size );

         if ( max_stack_buffer_size < size ) {
            free( buffer );
         }

         if( pk >= _next_primary_key )
            _next_primary_key = (pk >= no_available_primary_key) ? no_available_primary_key : (pk + 1);

         hana::for_each( _indices, [&]( auto& idx ) {
            typedef typename decltype(+hana::at_c<0>(idx))::type index_type;

            auto secondary = index_type::extract_secondary_key( obj );
            if( memcmp( &hana::at_c<index_type::index_number>(secondary_keys), &secondary, sizeof(secondary) ) != 0 ) {
               auto indexitr = mutableitem.__iters[index_type::number()];

               if( indexitr < 0 ) {
                  typename index_type::secondary_key_type temp_secondary_key;
                  indexitr = mutableitem.__iters[index_type::number()]
                           = secondary_index_db_functions<typename index_type::secondary_key_type>::db_idx_find_primary( _code.value, _scope, index_type::name(), pk,  temp_secondary_key );
               }

               secondary_index_db_functions<typename index_type::secondary_key_type>::db_idx_update( indexitr, payer.value, secondary );
            }
         });
      }
```
### implace
```c++
      template<typename Lambda>
      const_iterator emplace( name payer, Lambda&& constructor ) {
         using namespace _multi_index_detail;

         eosio::check( _code.value == current_receiver(), "cannot create objects in table of another contract" ); // Quick fix for mutating db using multi_index that shouldn't allow mutation. Real fix can come in RC2.

         auto itm = std::make_unique<item>( this, [&]( auto& i ){
            T& obj = static_cast<T&>(i);
            constructor( obj );

            size_t size = pack_size( obj );

            //using malloc/free here potentially is not exception-safe, although WASM doesn't support exceptions
            void* buffer = max_stack_buffer_size < size ? malloc(size) : alloca(size);

            datastream<char*> ds( (char*)buffer, size );
            ds << obj;

            auto pk = obj.primary_key();

            i.__primary_itr = db_store_i64( _scope, static_cast<uint64_t>(TableName), payer.value, pk, buffer, size );

            if ( max_stack_buffer_size < size ) {
               free(buffer);
            }

            if( pk >= _next_primary_key )
               _next_primary_key = (pk >= no_available_primary_key) ? no_available_primary_key : (pk + 1);

            hana::for_each( _indices, [&]( auto& idx ) {
               typedef typename decltype(+hana::at_c<0>(idx))::type index_type;

               i.__iters[index_type::number()] = secondary_index_db_functions<typename index_type::secondary_key_type>::db_idx_store( _scope, index_type::name(), payer.value, obj.primary_key(), index_type::extract_secondary_key(obj) );
            });
         });

         const item* ptr = itm.get();
         auto pk   = itm->primary_key();
         auto pitr = itm->__primary_itr;

         _items_vector.emplace_back( std::move(itm), pk, pitr );

         return {this, ptr};
      }
//https://github.com/EOSIO/eosio.cdt/blob/master/libraries/eosiolib/multi_index.hpp
```

### 그 외 함수
* `eosio_assert(1,"something")`는 false일 때 모든 code를 roll back 시켜 트랜잭션에 push 되지 않도록 합니다.
