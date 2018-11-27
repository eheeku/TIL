using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class sample2 : MonoBehaviour {
    int hp = 100;

	// Use this for initialization
	void Start () {
		
	}
	void OnMouseDown()
    {
        hp = hp - 20;
        print("hp=" + hp);
        if (hp > 50)
        {
            print("i am tried");
        }
        else if (hp > 1)
        {
            print("i am about to die");
            GetComponent < Renderer>().material.color = Color.red;
        }
        else
        {
            print("i am die");
            Destroy(gameObject);
        }
    }
	// Update is called once per frame
	void Update () {
		
	}
}
