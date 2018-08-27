# 블록체인 구조 만들기

### 목적

 python을 이용한 실습으로 블록체인에 관하여 이해하고자함 입니다.

### 블록체인이란

 블록체인이란 비트코인 (bitcoin) 또는 다른 암호해독(cryptocurrency)트랜잭션이 순서대로 공개되도록 기록되는 디지털 계약(원장)

> 새로운 데이터가 블록(container)에 저장되고 이전에 추가된 데이터인(block chain)에 추가되는 공용데이터 베이스
> 암호화폐 대부분 블록체인 기술을 사용한 **트랜잭션 그룹**과 같다.
> 중앙기관이 발행하거나 관리하지 않는다.
> **Smart Contracts(스마트 계약)**  이더리움과 같은 기술 형태로 분산 컴퓨팅에 혁신을 가져왔다.

### 블록체인 만들기 (Snake Coin)

#### 정의

1. 각 블록은 타임스탬프와 선택적 인덱스로 저장
2. snakecoin에서는 두가지를 모두 저장
3. 무결성을 보장하기 위한 자체 식별 Hash
4. 각 블록의 Hash는 블록의 인덱스, 타임스탬프,데이터 및 이전 블록 Hash의 Hash를 암호화 합니다.
5. 데이터는 개발자가 원하는 무엇이든지 될 수 있습니다.

------

#### 실습

```python
import hashlib as hasher

class Block:
	def __init__(self,index,timestamp,data,previous_hash):
	self.index = index
	self.timestamp = timestamp
	self.data = data
	self.previous_hash = previous_hash
	self.hash = self.hash_block()

    def hash_block(self):
        sha = hasher.sha256()
        sha.update(str(self.index)+
                    str(self.timestamp)+
                    str(self.data)+
                    str(self.previous_hash))
    #if you used python3
            sha.update((str(self.index)+
                    str(self.timestamp)+
                    str(self.data)+
                    str(self.previous_hash)).encode())


        return sha.hexdigest()
```

 코드와 같이 블록체인 구조를 만들었으면 다음은 실제로 블록을 체인에 추가해야 합니다.
 각 블록에는 이전 블록의 정보가 필요합니다.
  genesis block 은 특별한 블록이므로 고유 로직을 사용하여 추가해야 합니다.

#### genesis block

```python
import datetime as date
def create_genesis_block():
	#Manually construct a block with
	#index zero and arbitrary previous hash
	return Block(0, date.datetime.now(),"Genesis Block,"0")
	# index : 0, arbitrary data
```

#### 후속 블록

 새로 생성될 블록의 데이터를 만들고, 해당 데이터로 새 블록을 반환합니다.
 새로은 블록이 이전 블록의 정보를 hash할 때 블록체인의 무결성은 증가합니다.

- 체인구조의 교체(붕괴)에서 블록체인을 지킬 수 있다.

 따라서 한번 생성 된 해시체인은 암호화 증명 역할을 하게 되므로, 교체나 제거가 불가능합니다.

```python
def next_block(last_block):
	this_index = last_block.index + 1
	this_timestamp = date.datetime.now()
	this_data = "hey! i'm block" + str(this_index)
	this_hash = last_block.hash
	return Block(this_index, this_timestamp, this_data, this_hash)
```

#### for문을 이용한 작업 진행

```python
#Create the blockchain and add the genesis block
blockchain = [create_genesis_block()]
previous_block = blockchain[0]

# How many blocks should we add to the chain
# after the genesis block
num_of_blocks_to_add = 20

#add blocks to the chain
for i in range(0,num_of_blocks_to_add):
	block_to_add = next_block(previous_block)
	blockchain.append(block_to_add)
	previous_block = block_to_add
	# Tell everyone about it
	print"Block#{} has been added to the blockchain!".format(block_to_add.index)
	print"Hash: {}\n.".format(block_to_add.hash)
```

#### 추가로

 요즘 프로덕션 블록체인의 크기로 만들기 위해서는 주어진 시간내에 여러 시스템의 체인변경 사항을 추적하기 위한 [server layer](https://docs.oracle.com/cd/E19062-01/sun.mgmt.ctr36/819-5417/i1003744/index.html)와 작업증명 알고리즘[proof-of-work algorithm](https://blog.theloop.co.kr/2017/06/01/%EC%9E%91%EC%97%85%EC%A6%9D%EB%AA%85pow-proof-of-work%EA%B3%BC-%EC%A7%80%EB%B6%84%EC%A6%9D%EB%AA%85pos-proof-of-stake/)과 같은 기능을 추가해야 합니다.





[출처](http://lukious.com/2017/12/27/1%ED%8C%8C%EC%9D%B4%EC%8D%AC%EC%9C%BC%EB%A1%9C-%EB%B8%94%EB%A1%9D%EC%B2%B4%EC%9D%B8-%EA%B5%AC%EC%A1%B0-%EB%A7%8C%EB%93%A4%EA%B8%B0/)
joeunhee0806 @github
