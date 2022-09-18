Shader "CourseShaders/NormalMapping"
{
    Properties
    {
        _ColorTex ("Base Color", 2D) = "white" {}
        // Add "bump" instead of white
        _BumpMap ("Normal Map", 2D) = "bump" {}
        _NormalIntensity ("Normal Intensity", Range(0,5)) = 1

    }
    SubShader
    {
        CGPROGRAM

        #pragma surface Standard Lambert
        

        struct Input
        {
            float2 uv_ColorTex;
            float2 uv_NormalTex;
        };

        sampler2D _ColorTex;
        sampler2D _BumpMap;
        float _NormalIntensity;

        void Standard (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_ColorTex, IN.uv_ColorTex);
            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_NormalTex));
            // o.Normal *= float3(_NormalIntensity, _NormalIntensity, 1);
        }
        ENDCG
    }

    Fallback "Diffuse"
}