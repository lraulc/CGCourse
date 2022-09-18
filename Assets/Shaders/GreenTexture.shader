Shader "CourseShaders/GreenTexture"
{
    Properties
    {
        _colorTex ("Albedo", 2D) = "white"{}
    }

    SubShader
    {
        CGPROGRAM

        #pragma surface surf Lambert

        struct Input
        {
            fixed2 uv_colorTex;
        };

        sampler2D _colorTex;

        void surf (Input IN, inout SurfaceOutput o )
        {
            float4 greenColor = float4(0,1,0,1);
            o.Albedo = (tex2D(_colorTex, IN.uv_colorTex) * greenColor).rgb;
        }

        ENDCG
    }

    Fallback "Diffuse"
}