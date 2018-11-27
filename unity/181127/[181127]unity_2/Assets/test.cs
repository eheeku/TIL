using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class test : MonoBehaviour {

	// Use this for initialization
	void Start () {
        //transform.Translate(0, 0, 2f);    //현재 위치에서 x,y,z(0,0,2)만큼 이동하라
        //transform.Rotate(0, 40f, 0);      //회전시키기 y축으로 40도만큼
        Destroy(gameObject);                //자기자신 사라지기
    }
	
	// Update is called once per frame
	void Update () {    //매 프레임마다 계속실행
        //현재 위치에서 x,y,z(0,0,1)만큼 이동하라 (update에서 실행하면 z축으로 사라져버림)
        //transform.Translate(0, 0, 1f);

        //y축으로 계속 돔
        //transform.Rotate(0, 40f, 0);    //회전시키기 y축으로 40도만큼

        //속도 조절을 원할 때, Time.deltaTime
        //transform.Rotate(0, 30f*Time.deltaTime, 0);           //회전시키기 1초에 30도
        //transform.Translate(0, 2f * Time.deltaTime, 0);         //움직이기 1초에 2미터만큼

    }
}
