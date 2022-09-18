Shader "CourseShaders/FullProperties"
{
    Properties
    {
        _myColor ("Color", Color) = (1,0,0,1)
        _myRange ("Range", Range(0,5)) = 1
        _myTex ("Texture", 2D) = "white" {}
        _myCube ("Cube", Cube) = "" {}
        _myFloat ("Float", float) = 0.5
        _myVector ("Vector", Vector) = (0.5,1,1,1)
    }
    SubShader
    {
    CGPROGRAM

    #pragma surface surf Lambert

    struct Input
    {
        fixed2 uv_myTex;
        fixed3 worldRefl;
    };

    fixed4 _myColor;
    half _myRange;
    sampler2D _myTex;
    samplerCUBE _myCube;
    float _myFloat;
    fixed4 _myVector;


    void surf (Input IN, inout SurfaceOutput o)
    {
        o.Emission = texCUBE(_myCube, IN.worldRefl).rgb * _myFloat;
        o.Albedo =tex2D(_myTex, IN.uv_myTex) + (_myRange * _myColor);
    }
    ENDCG
    }

    Fallback "Diffuse"

}