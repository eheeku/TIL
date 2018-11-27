using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class act5 : MonoBehaviour {
    
	// Use this for initialization
	void Start () {
        Step(2);
        Step(12);
        Step(52);
    }
	void Step(int step)
    {
        if(step <= 10)
        {
            print("하급");
        }
        else if (step>=10 && step <= 20)
        {
            print("중급");
        }
        else if (step >= 30)
        {
            print("상급");
        }
        else
        {
            print("don't know");
            print("error");
        }
    }
	// Update is called once per frame
	void Update () {
		
	}
}
