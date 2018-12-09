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
