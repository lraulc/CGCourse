Shader "CourseShaders/ForceGreenColor"
{
    Properties
    {
        _MainTex ("Color Texture", 2D) = "whie" {}
    }
    SubShader
    {
    CGPROGRAM

    #pragma surface surf Lambert

    struct Input
    {
        fixed2 uv_MainTex;
    };

    sampler2D _MainTex;

    void surf (Input IN, inout SurfaceOutput o )
    {
        //Se asigna primero la textura de base color
        o.Albedo= tex2D(_MainTex, IN.uv_MainTex);
        //Se satura el canal verde del albedo
        o.Albedo.g = 1;
    }
    ENDCG
    }

    Fallback "Difuse"
        
}