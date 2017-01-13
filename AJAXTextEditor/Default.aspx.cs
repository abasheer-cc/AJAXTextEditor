//Author: Amshar Basheer
//Project Name: AJAXTextEditor
//File Name: Default.aspx.cs
//Date: 11/21/2014
//Description: WDD Assignment 5 -- AJAX Text Editor. This is a simple text editor web application that utilizes AJAX.  The user can make simple text edits and save
// or save as, which will save to a directory on the server called MyFiles.  The user can also open files in the dir MyFiles by selecting a file from a list box.  
//  AJAX is used to populate the file list when the "Update" button is clicked and to populate the text area when the "Open" button is clicked.
//  This is an ASP.NET web application in .NET 3.5 and utilizes AJAX by using script manager and update panels.


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO; //for file io stuff
using System.Text; //for string stuff
using System.Text.RegularExpressions; //for regex


namespace AJAXTextEditor
{
    public partial class _Default : System.Web.UI.Page
    {
        //using static class members to keep track of key variables across postbacks
        private static string path;
        private static string folder;
        private static bool fileNameSet = false;
        private static string currentFile;


        //Method Name: Page_Load
        //Parameters: object sender, EventArgs e
        //Return: void
        //Description: hides some asp labels upon loading of page and determines folder's physical path based on virtual path
        protected void Page_Load(object sender, EventArgs e)
        {            
            saveLabel.Visible = false;
            fileNameEmptyError.Visible = false;
            fileFormatErrorLabel.Visible = false;
            folder = Server.MapPath("~/MyFiles");            
       }


        //Method Name: okBtn_Click
        //Parameters: object sender, EventArgs e
        //Return: void
        //Description: ensures saveAsBox isn't empty or contains invalid format before saving file as. Then updates current file display. 
        protected void okBtn_Click(object sender, EventArgs e)
        {
            Regex reg = new Regex(@".*\.([tT][xX][tT])$"); //regex expression to ensure valid format of file.txt

            if (saveAsBox.Text != "") //ensure saveAsBox not empty
            {
                if (reg.IsMatch(saveAsBox.Text)) //ensure valid format
                {
                    //create directory if doesn't exist
                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }

                    //build path using folder path then append backslash and filename.txt
                    path = folder + "\\";
                    path += saveAsBox.Text;

                    //write all text in textEditArea to file
                    File.WriteAllText(path, textEditArea.Text);

                    //make temp variable set to path, then determine last backslash index and remove from beginning of string to one past that index to get just
                    //  file name, which is then set to currentFile and displayed
                    string temp = path;
                    int lastBackslashIndex = temp.LastIndexOf('\\');
                    currentFile = temp.Remove(0, lastBackslashIndex + 1);
                    currentFileName.Text = "Current File: " + currentFile;

                    //set fileNameSet flag to true for saveBtn and show save successful msg
                    fileNameSet = true;
                    saveLabel.Visible = true;
                }
                else
                {
                    //not empty, but invalid format so show invalid format error msg
                    fileFormatErrorLabel.Visible = true;
                }

            }
            else
            {
                //empty so show empty error msg
                fileNameEmptyError.Visible = true;
            }

        }


        //Method Name: saveBtn_Click
        //Parameters: object sender, EventArgs e
        //Return: void
        //Description: performs save functionality by first checking if fileNameSet and if so then just saves to same path, otherwise saves as untitled.txt
        protected void saveBtn_Click(object sender, EventArgs e)
        {
            if (fileNameSet) //if fileNameSet true then means already have path specified so can just save to that and show success msg
            {
                File.WriteAllText(path, textEditArea.Text);
                saveLabel.Visible = true;
            }
            else //otherwise make dir if doesn't exist before saving as untitled.txt and showing success msg
            {
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
                path = folder + "\\untitled.txt";
                File.WriteAllText(path, textEditArea.Text);
                saveLabel.Visible = true;
            }
        }


        //Method Name: updateBtn_Click
        //Parameters: object sender, EventArgs e
        //Return: void
        //Description: updates listbox with fileNames found in folder
        protected void updateBtn_Click(object sender, EventArgs e)
        {
            
            if (Directory.Exists(folder)) //check if folder exists
            {
                string[] filePaths = Directory.GetFiles(@folder + "\\"); //read filepaths
                string[] fileNames = filePaths; //make another copy for string manipulation to contain file names
                
                if (filePaths.Length != 0) //if dir not empy
                {
                    //loop through filePaths string array and build fileNames string array
                    for (int i = 0; i < filePaths.Length; ++i)
                    {
                        string temp = filePaths[i];
                        int lastBackslashIndex = temp.LastIndexOf('\\');
                        fileNames[i] = temp.Remove(0, lastBackslashIndex + 1);
                    }
                    //set list box to contain fileNames
                    fileList.DataSource = fileNames;
                    fileList.DataBind();
                }
            }
        }


        //Method Name: openBtn_Click
        //Parameters: object sender, EventArgs e
        //Return: void
        //Description: opens selected file from list box by displaying its contents in textEditArea, and then updates currentFile display
        protected void openBtn_Click(object sender, EventArgs e)
        {
            
            if (fileList.SelectedValue != "") //ensure something in list box is selected
            {
                //build path from folder then append backslash and fileName selected from listbox
                path = folder + "\\" + fileList.SelectedValue;
                
                //read all text from file into fileText string and display in textEditArea
                string fileText = File.ReadAllText(path);
                textEditArea.Text = fileText;

                //extract current file from string and display it, and also set fileNameSet to true for saveBtn 
                string temp = path;
                int lastBackslashIndex = temp.LastIndexOf('\\');
                currentFile = temp.Remove(0, lastBackslashIndex + 1);
                currentFileName.Text = "Current File: " + currentFile;
                fileNameSet = true;
            }
        }

          
    }
}