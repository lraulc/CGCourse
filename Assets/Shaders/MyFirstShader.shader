Shader "CourseShaders/MyFirstShader"
{
    Properties
    {
        _myColour("Example Colour", Color) = (1,0,0,1)
        _myEmissive("Emissive Colour", Color) = (0,0,0,1)
        _myNormal("Normal", Color) = (0,0,1,1)
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
        fixed4 _myEmissive;
        fixed4 _myNormal;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _myColour.rgb;
            o.Normal = _myNormal.rgb;
            o.Emission = _myEmissive.rgb;
        }
        ENDCG
    }
    Fallback "Diffuse"
}