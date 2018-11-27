using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class act4 : MonoBehaviour {
    public int numberA,numberB;
	// Use this for initialization
	void Start () {
        print("10+20 함수이용하여 출력");
        add(10, 20);
        print("number이용");
        numberA = 100;
        numberB = 200;
        add(numberA, numberB);
	}
	void add(int a, int b)
    {
        int c = a + b;
        print("합:"+c);
    }
	// Update is called once per frame
	void Update () {
		
	}
}
