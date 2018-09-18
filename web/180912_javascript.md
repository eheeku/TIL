# javascript

### 들어가기 전에
* 자바스크립트는 view에 대해 신경쓰지 않습니다
* 그러나 디자인을 변경하는 것이 가능합니다
* onclick 에 javascript가 들어가는 것은 약속입니다
* 문법보다는 언어적으로 이해하는 것이 효과적 입니다

### 서버와 클라이언트 흐름의 이해
* server와 client
	* 클라이언트의 요청에 따라 서버는 응답을 해야합니다
	* 그 사이에서 서버 단의 PHP는 서버에서 sql 데이터를 가지고 html 코드를 생성합니다.
	* 그 후 추합하여 웹 서버에게 돌려주면 웹 서버는 응답하는 역할을합니다
	* 그리고 웹 브라우저는 응답을 받아 html을 뿌려줍니다

### 간단한 문법
* 경고창 alert("원하는 문구");

### for 문과 html 함께 사용하기
```
    <script type="text/javascript">
      for(i=0;i<100;i++){
        document.write('<li>'+i+'</li>');
      }
    </script>
    
    <script type="text/javascript">
      for(i=0;i<100;i++){
        document.write('<li>'+(i*2)+'</li>'); //2배
      }
    </script>
```
### 디자인
* 예제 1
```
:: body 부분
<body class="dark" id="root">
<input type="button" value="white" onclick=" document.getElementById('root').setAttribute('class','')" />

<input type="button" value="dark" onclick=" document.getElementById('root').setAttribute('class','dark')" />

</body>
```
* 설명
	* 버튼 클릭 시 디자인을 변화하도록 합니다
	* getElementById : Id를 이용해서 어떤 태그를 얻는다
	* setAttribute('class','') : attribute (속성) 즉 클래스라는 이름을 가진 속성을 바꾼다 공백 문자를 변경합니다, dark라는 속성의 값을 지우는 일을 합니다
