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
