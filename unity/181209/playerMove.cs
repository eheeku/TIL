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
