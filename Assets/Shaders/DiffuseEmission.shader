Shader "CourseShaders/DiffuseEmission"
{
    Properties
    {
        _colorTex ("Color Texture", 2D) = "white" {}
        _emissionTex ("Emission Texture", 2D) = "black" {}
    }
    SubShader
    {
        CGPROGRAM

        #pragma surface standard Lambert

        struct Input
        {
            fixed2 uv_colorTex;
            fixed2 uv_emissionTex;
        };

        sampler2D _colorTex;
        sampler2D _emissionTex;

        void standard (Input IN, inout SurfaceOutput o )
        {
            o.Albedo = tex2D(_colorTex, IN.uv_colorTex);
            o.Emission = tex2D(_emissionTex, IN.uv_emissionTex);
        }
        ENDCG
    }
    Fallback "Diffuse"
}