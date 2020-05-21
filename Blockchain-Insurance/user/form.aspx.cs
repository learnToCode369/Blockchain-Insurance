using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnDownloadFile_Click(object sender, EventArgs e)
    {
        string strFileType, strFilePath;
        strFileType = ddlFileType.SelectedValue.ToString();
        switch (strFileType)
        {
            case "wordfile":
                strFilePath = "~\\form\\Motor Insurance Claim Form.doc";
                Download_File(strFilePath);
                break;
            case "excelfile":
                strFilePath = "~\\form\\Motor Insurance Claim Form.xlsx";
                Download_File(strFilePath);
                break;
            case "pdffile":
                strFilePath = "~\\form\\Motor Insurance Claim Form.pdf";
                Download_File(strFilePath);
                break;
            case "xmlfile":
                strFilePath = "~\\form\\Motor Insurance Claim Form.xml";
                Download_File(strFilePath);
                break;
            case "htmlfile":
                strFilePath = "~\\form\\Motor Insurance Claim Form.html";
                Download_File(strFilePath);
                break;
            case "csvfile":
                strFilePath = "~\\form\\Motor Insurance Claim Form.csv";
                Download_File(strFilePath);
                break;
            case "textfile":
                strFilePath = "~\\form\\Motor Insurance Claim Form.txt";
                Download_File(strFilePath);
                break;
        }
    }
    private void Download_File(string FilePath)
    {
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(FilePath));
        Response.WriteFile(FilePath);
        Response.End();
    }
}