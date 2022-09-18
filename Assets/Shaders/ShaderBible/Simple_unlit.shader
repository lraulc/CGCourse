Shader "ShaderBible/Simple_unlit"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Specular ("Specular", Range(0.0, 1.1)) = 0.3
        _Cid ("Color iD", int) = 2

        // Color
        _Color ("Tint", Color) = (1,1,1,1)
        // Vertex Position 
        _VPos ("Vertex Position", Vector) = (0,0,0,1)
        
        //Shader feature [Toggle]
        [Toggle]_Factor ("Enable Tint?", Float) = 0.3
        // Shader multi_compile
        // Se declara como float porque es un enumerator
        [KeywordEnum (Off, Red, Blue)] _Options ("Color Options", Float) = 0



    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM


            #pragma vertex vert
            #pragma fragment frag

            #pragma shader_feature _FACTOR_ON
            #pragma multi_compile _OPTIONS_OFF _OPTIONS_RED _OPTIONS_BLUE





            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float4 _Color;
            half _Factor;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            // Custom function
            float4 outFunction ()
            {
                float4 green = float4(0,1,0,1);
                return green;
            }

            half4 frag (v2f i) : SV_Target
            {
                float4 red = float4 (1,0,0,1);
                float4 blue = float4 (0,0,1,1);
                float4 col = tex2D(_MainTex, i.uv);

                // ENABLE COLOR TINT WITH TOGGLE
                // #if _FACTOR_ON
                // return col * _Color;
                // #else
                // return col;
                // #endif


                // Multi selector with multi_compile
                #if _OPTIONS_OFF
                return col;
                #elif _OPTIONS_RED
                return col * red;
                #elif _OPTIONS_BLUE
                return col * blue;
                #endif
            }
            ENDCG
        }
    }
}
