# collection
> [참고](http://excelsior-cjh.tistory.com/94)

* 컨테이너에 들어있는 요소의 갯수를 파악하여 dict형태로 return
* 리스트가 요소로 들어올 때는, 각 리스트가 가진 요소들의 빈도수를 가지고 dict를 만들어 return

## collections.Counter()
  컨테이너에 동일한 값의 자료가 몇개인지 파악합니다
>A Counter is a dict subclass for counting hashable objects. It is an unordered collection where elements are stored as dictionary keys and their counts are stored as **dictionary values**. Counts are allowed to be any integer value including zero or negative counts. The Counter class is similar to bags or multisets in other languages.

## 예제
### 1) list  >> dict
```python
import collections
lst1 = ['aa', 'cc', 'dd', 'aa', 'bb', 'ee']
print(collections.Counter(lst1))
#결과
Counter({'aa': 2, 'cc': 1, 'dd': 1, 'bb': 1, 'ee': 1})
'''