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
