using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteAlways]
public class USBReplacementController : MonoBehaviour
{
    // Shader de reemplazo
    public Shader m_replacementShader;

    private void OnEnable()
    {
        if (m_replacementShader != null)
        {
            GetComponent<Camera>().SetReplacementShader(m_replacementShader, "RenderType");
        }
    }

    private void OnDisable()
    {
        GetComponent<Camera>().ResetReplacementShader();
    }

}
