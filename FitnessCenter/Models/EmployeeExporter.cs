using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessCenter.Models
{
    public class EmployeeExporter
    {
        public static void GetDocument(string filename)
        {
            var employees = EmployeeDal.GetEmployees();
            CreateDocument(employees, filename, "");
        }

        private static void CreateDocument(List<Employee> employees, string filename, string title)
        {
            try
            {
                //Create an instance for word app
                Microsoft.Office.Interop.Word.Application winword = new Microsoft.Office.Interop.Word.Application();
                
                //Set status for word application is to be visible or not.
                winword.Visible = false;

                //Create a missing variable for missing value
                object missing = System.Reflection.Missing.Value;

                //Create a new document
                Microsoft.Office.Interop.Word.Document document = winword.Documents.Add(ref missing, ref missing, ref missing, ref missing);

                //Add header into the document
                foreach (Microsoft.Office.Interop.Word.Section section in document.Sections)
                {
                    //Get the header range and add the header details.
                    Microsoft.Office.Interop.Word.Range headerRange = section.Headers[Microsoft.Office.Interop.Word.WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;
                    headerRange.Fields.Add(headerRange, Microsoft.Office.Interop.Word.WdFieldType.wdFieldPage);
                    headerRange.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    headerRange.Font.ColorIndex = Microsoft.Office.Interop.Word.WdColorIndex.wdBlue;
                    headerRange.Font.Size = 10;
                    headerRange.Text = "Сотрудники";
                }

                //Add the footers into the document
                foreach (Microsoft.Office.Interop.Word.Section wordSection in document.Sections)
                {
                    //Get the footer range and add the footer details.
                    Microsoft.Office.Interop.Word.Range footerRange = wordSection.Footers[Microsoft.Office.Interop.Word.WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;
                    footerRange.Font.ColorIndex = Microsoft.Office.Interop.Word.WdColorIndex.wdDarkRed;
                    footerRange.Font.Size = 10;
                    footerRange.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    footerRange.Text = String.Format("Фитнесс центр, {0}", DateTime.Now.ToShortDateString());
                }

                //Add paragraph with Heading 1 style
                Microsoft.Office.Interop.Word.Paragraph para1 = document.Content.Paragraphs.Add(ref missing);
                para1.Range.Text = title;
                para1.Range.InsertParagraphAfter();                

                //Create a 5X5 table and insert some dummy record
                Table firstTable = document.Tables.Add(para1.Range, employees.Count + 1, 4, ref missing, ref missing);

                firstTable.Borders.Enable = 1;

                firstTable.Rows[1].Cells[1].Range.Text = "Фамилия";
                firstTable.Rows[1].Cells[2].Range.Text = "Имя";
                firstTable.Rows[1].Cells[3].Range.Text = "Отчество";
                firstTable.Rows[1].Cells[4].Range.Text = "Описание";

                for (int i = 0; i < employees.Count; i++)
                {
                    firstTable.Rows[i + 2].Cells[1].Range.Text = employees[i].Surname;
                    firstTable.Rows[i + 2].Cells[2].Range.Text = employees[i].Name;
                    firstTable.Rows[i + 2].Cells[3].Range.Text = employees[i].MiddleName;
                    firstTable.Rows[i + 2].Cells[4].Range.Text = employees[i].Description;
                }

                //Save the document
                object file = filename;
                document.SaveAs(ref file);
                document.Close(ref missing, ref missing, ref missing);
                document = null;
                winword.Quit(ref missing, ref missing, ref missing);
                winword = null;
            }
            catch (Exception ex)
            {
            }
        }
    }
}