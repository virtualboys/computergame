using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayMovieTex : MonoBehaviour {

	// Use this for initialization
	void Start () {
		MovieTexture tex = GetComponent<Renderer> ().material.mainTexture as MovieTexture;
		tex.loop = true;
		tex.Play ();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
