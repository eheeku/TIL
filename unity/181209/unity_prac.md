# 유니티
### enemy hit
```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyHit : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}

    void OnTriggerEnter(Collider col)
    {
        if ( col.gameObject.tag == "bullet")
        {
            Destroy(gameObject);
        }
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}

```
### player move
```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playerMove : MonoBehaviour {
    public float moveSpeed = 5f;
    public float rotateSpeed = 30f;
	// Use this for initialization
	void Start () {
     
	}
	
	// Update is called once per frame
	void Update () {
        float moveDistanceZ = moveSpeed * Time.deltaTime * Input.GetAxis("Vertical");
        transform.Translate(0, 0, moveDistanceZ);

        float rotateDistanceY = rotateSpeed * Time.deltaTime * Input.GetAxis("Horizontal");
        transform.Rotate(0,rotateDistanceY, 0);
    }
}

```
### cameracontrol
```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraControl : MonoBehaviour {
    GameObject player;
    Vector3 offset;
	// Use this for initialization
	void Start () {
        player = GameObject.FindWithTag("Player");
        offset = player.transform.position - transform.position;
	}
	
	// Update is called once per frame
	void Update () {
       
	}
    void LateUpdate()
    {
        transform.position = player.transform.position - offset;
    }
}

```
### playerShoot 
```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerShoot : MonoBehaviour {
    public GameObject bulletPrefab;

    float delayTimer = 0f;
    //1초가 지나야만 총알이 생성되도록 합니다.
    public float shootDelayTime = 1f;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        // 시간의 흐름에 따라 딜레이타임 증가
        delayTimer += Time.deltaTime;

        //delayTimer > shootDelayTime : 1초보다 많아졌을때만 아래 있는 명령어 실행
        if (Input.GetButtonDown("Jump") && delayTimer > shootDelayTime)
        {
            Instantiate(bulletPrefab,transform.position,transform.rotation);
            //총알 만들고 딜레이타임 다시 0 으로 
            delayTimer = 0f;
        }
	}
}

```
### bulletMove
```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletMove2 : MonoBehaviour
{
    public float moveSpeed = 10f;
    public float destroyTime = 2f;
    // Use this for initialization
    void Start()
    {
        //3초 뒤 자동삭제
        Destroy(gameObject, destroyTime);
    }

    // Update is called once per frame
    void Update()
    {

        transform.Translate(0, 0, moveSpeed * Time.deltaTime);
    }
}

```