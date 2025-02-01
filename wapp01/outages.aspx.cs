using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace wapp01
{
    /// <summary>
    /// snaked this whole class off an answer here:
    /// https://stackoverflow.com/questions/668907/how-to-delete-a-line-from-a-text-file-in-c
    /// </summary>
    public static class TextLineRemover
    {
        public static void RemoveTextLines(IList<string> matchValue, string filename, string tempFilename)
        {
            // Initial values
            int lineNumber = 0;
            int linesRemoved = 0;
            DateTime startTime = DateTime.Now;

            // Read file
            using (var sr = new StreamReader(filename))
            {
                // Write new file
                using (var sw = new StreamWriter(tempFilename))
                {
                    // Read lines
                    string line;
                    while ((line = sr.ReadLine()) != null)
                    {
                        lineNumber++;
                        // Look for text to remove
                        if (!ContainsString(line, matchValue))
                        {
                            // Keep lines that does not match
                            sw.WriteLine(line);
                        }
                        else
                        {
                            // Ignore lines that DO match
                            linesRemoved++;
                            InvokeOnRemovedLine(new RemovedLineArgs { RemovedLine = line, RemovedLineNumber = lineNumber });
                        }
                    }
                }
            }
            // Delete original file
            File.Delete(filename);

            // ... and put the temp file in its place.
            File.Move(tempFilename, filename);

            // Final calculations
            DateTime endTime = DateTime.Now;
            InvokeOnFinished(new FinishedArgs { LinesRemoved = linesRemoved, TotalLines = lineNumber, TotalTime = endTime.Subtract(startTime) });
        }

        private static bool ContainsString(string line, IEnumerable<string> linesToRemove)
        {
            foreach (var lineToRemove in linesToRemove)
            {
                Regex regex = new Regex("^[A-Z0-9]{6}");
                if (line.Contains(lineToRemove) && lineToRemove != "" && regex.IsMatch(lineToRemove.ToString()))
                    return true;
            }
            return false;
        }

        public static event RemovedLine OnRemovedLine;
        public static event Finished OnFinished;

        public static void InvokeOnFinished(FinishedArgs args)
        {
            Finished handler = OnFinished;
            if (handler != null) handler(null, args);
        }

        public static void InvokeOnRemovedLine(RemovedLineArgs args)
        {
            RemovedLine handler = OnRemovedLine;
            if (handler != null) handler(null, args);
        }
    }

    public delegate void Finished(object sender, FinishedArgs args);

    public class FinishedArgs
    {
        public int TotalLines { get; set; }
        public int LinesRemoved { get; set; }
        public TimeSpan TotalTime { get; set; }
    }

    public delegate void RemovedLine(object sender, RemovedLineArgs args);

    public class RemovedLineArgs
    {
        public string RemovedLine { get; set; }
        public int RemovedLineNumber { get; set; }
    }
    /// <summary>
    /// 
    /// </summary>
    public partial class WebForm1 : System.Web.UI.Page
    {


        private List<string> list = new List<string>();
        private List<string> list2 = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {


            using (StreamReader reader = new StreamReader("C:/inetpub/wwwroot/data.csv"))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {

                    list.Add(line); // Add to the 'list' array of strings

                }
                reader.Close();//dont think i need to close n' dispose because of 'using'
                reader.Dispose();//but do it just in case

            }
            foreach (string csvLine in list)
            {

                TableRow newRow = new TableRow();
                string[] splitValues = csvLine.Split(',');

                foreach (string cell in splitValues)
                {
                    TableCell newCell = new TableCell();

                    newCell.Text = cell;
                    newRow.Cells.Add(newCell);
                    Table1.Rows.Add(newRow);
                }

                //newCell.Text = csvLine;
                //newRow.Cells.Add(newCell);

                //Table1.Rows.Add(newRow);
            }
        }




        protected void Button2_Click(object sender, EventArgs e)
        {


            string fields;
            // Write to CSV file
            using (FileStream fs = new FileStream("C:/inetpub/wwwroot/data.csv", FileMode.Append, FileAccess.Write))
            using (StreamWriter sw = new StreamWriter(fs))
            {
                //create a random alphanumberic code to use as the outage id for a "unique" reference
                string outageID = Guid.NewGuid().ToString("n").Substring(0, 6).ToUpper();
                fields = outageID + "," + DropDownList1.Text + "," + TextBox2.Text + "," + TextBox3.Text + "," + TextBox4.Text + "," + TextBox5.Text;
                //List<string> fields = new List<string> { DropDownList1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text };
                sw.WriteLine(fields);
            }

            
            ClientScript.RegisterClientScriptBlock(Page.GetType(), "refreshNotResubmit", "<script>window.location = window.location = window.location.href;</script");
            



        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //trying some javascript cancle the delete if the user clicks 'cancel'
            //ok the confirm doesnt actually work
            string outageRef = TextBox6.Text;
            //to get the confirm working, probably need to change the confirm delete button
            //to be a javascript button with an onClick() method that calls the code 
            //in this asp Button click to delete the line containing the outageRef.
            //then the javascript can wait for the response from the confirm()
            //would need to pass TextBox6.value when the csharp is called 
            //something like <button onClick="<%deleteOutageRef(TextBox6.value%>">
            //the c# method declaration would be something like 
            //protected void deleteOutageRef(string deleteRef){TextLineRemover.RemoveTextLines(new List<string> { deleteRef }, "C:/inetpub/wwwroot/data.csv", fileName + ".tmp");}
            //ClientScript.RegisterClientScriptBlock(Page.GetType(), "confirmDelete", "<script>if(confirm('Are you sure you want to delete this one?') != true){document.getElementById('TextBox6').value = '';}</script>");
            //System.Threading.Thread.Sleep(10000);

            string fileName = "C:/inetpub/wwwroot/data.csv";
            
            //TextLineRemover class snaked from stackexchange answers
            //works though
            TextLineRemover.RemoveTextLines(new List<string> { outageRef }, fileName, fileName + ".tmp");
            ClientScript.RegisterClientScriptBlock(Page.GetType(), "refreshNotResubmit", "<script>window.location = window.location = window.location.href;</script");
        }
    }
}