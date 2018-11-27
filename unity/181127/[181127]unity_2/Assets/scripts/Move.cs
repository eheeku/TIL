using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Move : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        //transform.Rotate(20f*Time.deltaTime, 0, 0);
        //위치 옮기기
        //AirplaneFront();
        //AirplaneBack();
        //AirplaneRight();
        //AirplaneLetf();
    }
    void AirplaneFront()    //전진
    {
        transform.Translate(0, 0, 2f * Time.deltaTime);
        
    }

    void AirplaneBack()     //후진
    {
        transform.Translate(0, 0, -2f * Time.deltaTime);
    }

    void AirplaneLeft()     //왼쪽
    {
        transform.Translate(2f * Time.deltaTime * -1f, 0, 0);
    }

    void AirplaneRight()     //오른쪽
    {
        transform.Translate(2f * Time.deltaTime * 1f, 0, 0);
    }
}
