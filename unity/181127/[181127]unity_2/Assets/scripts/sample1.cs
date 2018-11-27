using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class sample1 : MonoBehaviour {
    public bool isTrue = false;
    int hp = 100;

	// Use this for initialization
	void Start () {
        print("hello");
	}

    void OnMouseDown()
    {
        hp = hp - 10;
        print (hp);
        if(isTrue == true)
        {
            transform.Rotate(50f, 0, 0);
        }
    }

    // Update is called once per frame
    void Update () {
		
	}
}
