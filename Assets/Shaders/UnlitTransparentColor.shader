Shader "Unlit/TransparentColorTex" {

     Properties {
         _MainTex("_Color", 2D) = "white" {}
         _Color("Cutout Color", Color) = (1,1,1,1)
     }
 
     SubShader {

         Tags {"IgnoreProjector" = "True" "Queue" = "Transparent"}
         Blend SrcAlpha OneMinusSrcAlpha 

         Pass {
         	ZTest Always 
         	Cull Off 
         	ZWrite Off 

         	Fog{ Mode off }
 
         CGPROGRAM
 
 		 #pragma vertex vert
 		 #pragma fragment frag
 		 #pragma fragmentoption ARB_precision_hint_fastest
 		 #include "UnityCG.cginc"
 		 #pragma target 3.0
 
	     struct v2f {
	         float4 pos      : POSITION;
	         float2 uv       : TEXCOORD0;
	     };
	 
	     uniform sampler2D _MainTex;
	     uniform half4 _Color;
	 
	     v2f vert(appdata_img v) {
	         v2f o;
	         o.pos = UnityObjectToClipPos(v.vertex);
	         o.uv = MultiplyUV(UNITY_MATRIX_TEXTURE0, v.texcoord);
	         
	         return o;
	     }
	 
	     half4 frag(v2f i) : COLOR {
	         half4 color = tex2D(_MainTex, i.uv) * _Color;
	         return color;
	     }
	 
	     ENDCG
	     }
     }
     FallBack "Diffuse"
 }