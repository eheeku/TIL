# 삽질
> 처음 eos 개발 tutorial에서 겪을 수 있는 문제, 겪은 문제들을 직접 해보며 정리하고자 합니다

## 콘솔에 print가 출력되지 않을 때
![non_print](./img/non_print.png)
contract에서 print 함수를 사용했음에도 불구하고 hello, bob이 출력되지 않았다
![print](./img/print.png)
nodeos 실행 시 --contracts-console 옵션 추가

## database dirty flag set
* 오류내용
```
 database dirty flag set (likely due to unclean shutdown): replay required
```
데이터 디렉토리의 정리가 필요합니다.
`~ / .local / share / eosio / nodeos / data ( "blocks"및 "state"폴더 삭제)` 이 경로에서 삭제를 해주어도 되고, `nodeos`옵션에 `--delete-all-blocks`를 포함시켜 주니 해결되었다. (그러나, 이게 좋은 방법인지 잘 모르겠다)

```
error 2019-03-05T00:13:07.295 
thread-0  controller.cpp:1739 startup] 
No head block in fork db, perhaps we need to replay
warn  2019-03-05T00:13:07.295 thread-0  controller.cpp:585 initialize_fork_db]  
Initializing new blockchain with genesis state
```
그러고나면 헤드가 없다는 내용과 새로운 블록체인 제네시스 부터 다시 만들어준다

## Failed with error: unspecified (0)
![unspecified](./img/unspecified(0).png)
계정생성을 다시 해주면 해결된다

# option
## eosio option
> PATH  ~/.local/share/eosio/nodeos/config.ini

* -e
  * config.ini `enable-stale-producion = true`
  * 블록체인이 stale하더라도 블록체인을 생산할 수 있도록 합니다.
  * 단일 로컬 블록체인인 경우 stale할 가능성이 매우 높다.
  	* 단일 로컬 블록체인으로 노드를 실행하는 경우는 필수 옵션
* -p
  * config.ini `producer-name = eosio`는 `-p eosio`와 같습니다
  * 블록생산자 (block producer)를 설정합니다. 이 옵션 뒤에 블록생산자를 열거합니다
  * eosio 계정이 블록생산자가 됩니다
  	* eosio 계정이 default로 제공됩니다
* -plugin
  * 같이 실행 될 플러그인을 설정합니다.
  * 플러그인 각각에 대해 옵션설정도 가능합니다
  * 자주 사용되는 플러그인 `eosio::chain_api_plugin'와 'eosio::history_api_plugin`
  * [기타 플러그인은 여기서 확인할 수 있습니다](https://developers.eos.io/eosio-nodeos/docs/bnet_plugin)
* --contracts-console
  * `contracts-console=true`
  * 스마트 컨트랙트의 콘솔 출력을 nodeos의 출력에 표시되도록 돕습니다
