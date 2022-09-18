Shader "CourseShaders/PackedPractice"
{
    Properties
    {
        _myColour ("Example Colour", Color) = (1,0,0,1)
    }

    SubShader
    {
        CGPROGRAM

        #pragma surface surf Lambert

        struct Input
        {
            float2 uvMainTex;
        };

        fixed4 _myColour;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _myColour.rgb;
        }
        ENDCG
    }

    Fallback "Diffuse"

}