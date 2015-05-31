using FitnessCenter.DataAccess;
using FitnessCenter.Entities;
using Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessCenter.Models
{
    public class ExportHelper
    {
        public static void CreateActivitiesReport(string filename)
        {
            var activities = ActivityDal.GetActivities();

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
                    headerRange.Text = "Список услуг";
                }

                //Add the footers into the document
                foreach (Microsoft.Office.Interop.Word.Section wordSection in document.Sections)
                {
                    //Get the footer range and add the footer details.
                    Microsoft.Office.Interop.Word.Range footerRange = wordSection.Footers[Microsoft.Office.Interop.Word.WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;
                    footerRange.Font.ColorIndex = Microsoft.Office.Interop.Word.WdColorIndex.wdBlue;
                    footerRange.Font.Size = 10;
                    footerRange.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    footerRange.Text = String.Format("Фитнесс центр, {0}", DateTime.Now.ToShortDateString());
                }

                foreach (var item in activities.GroupBy(a => a.Type.Name))
                {
                    Microsoft.Office.Interop.Word.Paragraph par = document.Content.Paragraphs.Add(ref missing);
                    par.Range.Font.Size = 14;
                    par.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    par.Range.Bold = 1;
                    par.SpaceBefore = 24;
                    par.SpaceAfter = 8;
                    par.Range.Text = item.Key;
                    par.Range.InsertParagraphAfter();

                    foreach (var activity in item)
                    {
                        Microsoft.Office.Interop.Word.Paragraph name = document.Content.Paragraphs.Add(ref missing);
                        name.Range.Font.Size = 14;
                        name.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                        name.Range.Text = activity.Name;
                        name.Range.Bold = 1;
                        name.SpaceAfter = 4;
                        name.Range.InsertParagraphAfter();

                        Microsoft.Office.Interop.Word.Paragraph duration = document.Content.Paragraphs.Add(ref missing);
                        duration.Range.Font.Size = 14;
                        duration.Range.Bold = 0;
                        duration.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                        duration.Range.Text = String.Format("Продолжительность: {0:hh\\:mm}", activity.Duration);
                        duration.Range.InsertParagraphAfter();

                        Microsoft.Office.Interop.Word.Paragraph desc = document.Content.Paragraphs.Add(ref missing);
                        desc.Range.Font.Size = 14;
                        desc.Range.Bold = 0;
                        desc.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                        desc.Range.Text = activity.Description;
                        desc.Range.InsertParagraphAfter();
                    }

                    par.Range.InsertParagraphAfter();
                    par.Range.InsertParagraphAfter();
                }

                //Create a 5X5 table and insert some dummy record
                //Table firstTable = document.Tables.Add(para1.Range, activities.Count + 1, 4, ref missing, ref missing);

                //firstTable.Borders.Enable = 1; 

                //firstTable.Rows[1].Cells[1].Range.Text = "Фамилия";
                //firstTable.Rows[1].Cells[2].Range.Text = "Имя";
                //firstTable.Rows[1].Cells[3].Range.Text = "Отчество";
                //firstTable.Rows[1].Cells[4].Range.Text = "Описание";

                //for (int i = 0; i < employees.Count; i++)
                //{
                //    firstTable.Rows[i + 2].Cells[1].Range.Text = employees[i].Surname;
                //    firstTable.Rows[i + 2].Cells[2].Range.Text = employees[i].Name;
                //    firstTable.Rows[i + 2].Cells[3].Range.Text = employees[i].MiddleName;
                //    firstTable.Rows[i + 2].Cells[4].Range.Text = employees[i].Description;
                //}

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

        public static void CreateClientsReport(string filename)
        {
            var clients = ClientDal.GetClients();

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
                    headerRange.Text = "Список клиентов";
                }

                //Add the footers into the document
                foreach (Microsoft.Office.Interop.Word.Section wordSection in document.Sections)
                {
                    //Get the footer range and add the footer details.
                    Microsoft.Office.Interop.Word.Range footerRange = wordSection.Footers[Microsoft.Office.Interop.Word.WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;
                    footerRange.Font.ColorIndex = Microsoft.Office.Interop.Word.WdColorIndex.wdBlue;
                    footerRange.Font.Size = 10;
                    footerRange.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    footerRange.Text = String.Format("Фитнесс центр, {0}", DateTime.Now.ToShortDateString());
                }

                //Add paragraph with Heading 1 style
                Microsoft.Office.Interop.Word.Paragraph para1 = document.Content.Paragraphs.Add(ref missing);
                para1.Range.Font.Size = 16;
                para1.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                para1.Range.Text = "Клиенты";
                para1.Range.InsertParagraphAfter();                

                Table firstTable = document.Tables.Add(para1.Range, clients.Count + 1, 6, ref missing, ref missing);

                firstTable.Borders.Enable = 1; 

                firstTable.Rows[1].Cells[1].Range.Text = "Фамилия";
                firstTable.Rows[1].Cells[2].Range.Text = "Имя";
                firstTable.Rows[1].Cells[3].Range.Text = "Отчество";
                firstTable.Rows[1].Cells[4].Range.Text = "Дата рождения";
                firstTable.Rows[1].Cells[5].Range.Text = "Адрес";
                firstTable.Rows[1].Cells[6].Range.Text = "Телефон";

                for (int i = 0; i < clients.Count; i++)
                {
                    firstTable.Rows[i + 2].Cells[1].Range.Text = clients[i].Surname;
                    firstTable.Rows[i + 2].Cells[2].Range.Text = clients[i].Name;
                    firstTable.Rows[i + 2].Cells[3].Range.Text = clients[i].MiddleName;
                    firstTable.Rows[i + 2].Cells[4].Range.Text = clients[i].BirthdayDate != null ? clients[i].BirthdayDate.Value.ToShortDateString() : String.Empty;
                    firstTable.Rows[i + 2].Cells[5].Range.Text = clients[i].Address;
                    firstTable.Rows[i + 2].Cells[6].Range.Text = clients[i].Phone;
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

        public static void CreateEmployeesReport(string filename, List<Employee> employees, string title)
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
                    headerRange.Text = "Список сотрудников";
                }

                //Add the footers into the document
                foreach (Microsoft.Office.Interop.Word.Section wordSection in document.Sections)
                {
                    //Get the footer range and add the footer details.
                    Microsoft.Office.Interop.Word.Range footerRange = wordSection.Footers[Microsoft.Office.Interop.Word.WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;
                    footerRange.Font.ColorIndex = Microsoft.Office.Interop.Word.WdColorIndex.wdBlue;
                    footerRange.Font.Size = 10;
                    footerRange.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    footerRange.Text = String.Format("Фитнесс центр, {0}", DateTime.Now.ToShortDateString());
                }

                //Add paragraph with Heading 1 style
                Microsoft.Office.Interop.Word.Paragraph para1 = document.Content.Paragraphs.Add(ref missing);
                para1.Range.Font.Size = 16;
                para1.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                para1.Range.Text = title;
                para1.Range.InsertParagraphAfter();

                Table firstTable = document.Tables.Add(para1.Range, employees.Count + 1, 10, ref missing, ref missing);

                firstTable.Borders.Enable = 1;

                firstTable.Rows[1].Cells[1].Range.Text = "Фамилия";
                firstTable.Rows[1].Cells[2].Range.Text = "Имя";
                firstTable.Rows[1].Cells[3].Range.Text = "Отчество";
                firstTable.Rows[1].Cells[4].Range.Text = "Должность";
                firstTable.Rows[1].Cells[5].Range.Text = "Зарплата";
                firstTable.Rows[1].Cells[5].Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphRight;
                firstTable.Rows[1].Cells[6].Range.Text = "Дата рождения";
                firstTable.Rows[1].Cells[7].Range.Text = "Адрес";
                firstTable.Rows[1].Cells[8].Range.Text = "Телефон";
                firstTable.Rows[1].Cells[9].Range.Text = "Дата приема";
                firstTable.Rows[1].Cells[10].Range.Text = "Дата увольнения";

                for (int i = 0; i < employees.Count; i++)
                {
                    firstTable.Rows[i + 2].Cells[1].Range.Text = employees[i].Surname;
                    firstTable.Rows[i + 2].Cells[2].Range.Text = employees[i].Name;
                    firstTable.Rows[i + 2].Cells[3].Range.Text = employees[i].MiddleName;
                    firstTable.Rows[i + 2].Cells[4].Range.Text = employees[i].Position.Name;
                    firstTable.Rows[i + 2].Cells[5].Range.Text = employees[i].Salary != null ? employees[i].Salary.Value.ToString("F2") : String.Empty;
                    firstTable.Rows[i + 2].Cells[5].Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphRight;
                    firstTable.Rows[i + 2].Cells[6].Range.Text = employees[i].BirthdayDate != null ? employees[i].BirthdayDate.Value.ToShortDateString() : String.Empty;
                    firstTable.Rows[i + 2].Cells[7].Range.Text = employees[i].Address;
                    firstTable.Rows[i + 2].Cells[8].Range.Text = employees[i].Phone;
                    firstTable.Rows[i + 2].Cells[9].Range.Text = employees[i].AcceptanceDate.ToShortDateString();
                    firstTable.Rows[i + 2].Cells[10].Range.Text = employees[i].LeaveDate != null ? employees[i].LeaveDate.Value.ToShortDateString() : String.Empty;
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

        public static void CreateTimetableReport(string filename, List<TimetableItem> items, string title)
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
                    headerRange.Text = "Расписание";
                }

                //Add the footers into the document
                foreach (Microsoft.Office.Interop.Word.Section wordSection in document.Sections)
                {
                    //Get the footer range and add the footer details.
                    Microsoft.Office.Interop.Word.Range footerRange = wordSection.Footers[Microsoft.Office.Interop.Word.WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;
                    footerRange.Font.ColorIndex = Microsoft.Office.Interop.Word.WdColorIndex.wdBlue;
                    footerRange.Font.Size = 10;
                    footerRange.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    footerRange.Text = String.Format("Фитнесс центр, {0}", DateTime.Now.ToShortDateString());
                }

                //Add paragraph with Heading 1 style
                Microsoft.Office.Interop.Word.Paragraph para1 = document.Content.Paragraphs.Add(ref missing);
                para1.Range.Font.Size = 16;
                para1.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                para1.Range.Text = title;
                para1.Range.InsertParagraphAfter();

                var hours = (items.Max(e => e.EndTime) - items.Min(s => s.StartTime)).Hours + 1;

                Table firstTable = document.Tables.Add(para1.Range, hours + 1, 8, ref missing, ref missing);

                firstTable.Borders.Enable = 1;

                
                firstTable.Rows[1].Cells[2].Range.Text = "Понедельник";
                firstTable.Rows[1].Cells[3].Range.Text = "Вторник";
                firstTable.Rows[1].Cells[4].Range.Text = "Среда";
                firstTable.Rows[1].Cells[5].Range.Text = "Четверг";
                firstTable.Rows[1].Cells[6].Range.Text = "Пятница";
                firstTable.Rows[1].Cells[7].Range.Text = "Суббота";
                firstTable.Rows[1].Cells[8].Range.Text = "Воскресенье";

                for (int i = 0; i < hours; i++)
                {
                    var t = new TimeSpan(i, 0, 0);
                    var tt = t + items.Min(s => s.StartTime);
                    firstTable.Rows[i + 2].Cells[1].Range.Text = tt.ToString("hh\\:mm");

                    var el = items.Where(j => j.DayOfWeek == 1 && j.StartTime >= tt && j.StartTime < tt + new TimeSpan(1, 0, 0));
                    foreach (var e in el)
                    {
                        firstTable.Rows[i + 2].Cells[2].Range.Text += e.Info2;
                    }

                    el = items.Where(j => j.DayOfWeek == 2 && j.StartTime >= tt && j.StartTime < tt + new TimeSpan(1, 0, 0));
                    foreach (var e in el)
                    {
                        firstTable.Rows[i + 2].Cells[3].Range.Text += e.Info2;
                    }

                    el = items.Where(j => j.DayOfWeek == 3 && j.StartTime >= tt && j.StartTime < tt + new TimeSpan(1, 0, 0));
                    foreach (var e in el)
                    {
                        firstTable.Rows[i + 2].Cells[4].Range.Text += e.Info2;
                    }

                    el = items.Where(j => j.DayOfWeek == 4 && j.StartTime >= tt && j.StartTime < tt + new TimeSpan(1, 0, 0));
                    foreach (var e in el)
                    {
                        firstTable.Rows[i + 2].Cells[5].Range.Text += e.Info2;
                    }

                    el = items.Where(j => j.DayOfWeek == 5 && j.StartTime >= tt && j.StartTime < tt + new TimeSpan(1, 0, 0));
                    foreach (var e in el)
                    {
                        firstTable.Rows[i + 2].Cells[6].Range.Text += e.Info2;
                    }

                    el = items.Where(j => j.DayOfWeek == 6 && j.StartTime >= tt && j.StartTime < tt + new TimeSpan(1, 0, 0));
                    foreach (var e in el)
                    {
                        firstTable.Rows[i + 2].Cells[7].Range.Text += e.Info2;
                    }

                    el = items.Where(j => j.DayOfWeek == 7 && j.StartTime >= tt && j.StartTime < tt + new TimeSpan(1, 0, 0));
                    foreach (var e in el)
                    {
                        firstTable.Rows[i + 2].Cells[8].Range.Text += e.Info2;
                    }
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

        public static void CreateTicketOrderReport(string filename, List<TicketOrder> orders, string title)
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
                    headerRange.Text = "Отчет по продажам";
                }

                //Add the footers into the document
                foreach (Microsoft.Office.Interop.Word.Section wordSection in document.Sections)
                {
                    //Get the footer range and add the footer details.
                    Microsoft.Office.Interop.Word.Range footerRange = wordSection.Footers[Microsoft.Office.Interop.Word.WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;
                    footerRange.Font.ColorIndex = Microsoft.Office.Interop.Word.WdColorIndex.wdBlue;
                    footerRange.Font.Size = 10;
                    footerRange.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    footerRange.Text = String.Format("Фитнесс центр, {0}", DateTime.Now.ToShortDateString());
                }

                //Add paragraph with Heading 1 style
                Microsoft.Office.Interop.Word.Paragraph para1 = document.Content.Paragraphs.Add(ref missing);
                para1.Range.Font.Size = 16;
                para1.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                para1.Range.Text = title;
                para1.Range.InsertParagraphAfter();

                var groups = orders.GroupBy(o => o.Ticket.Name);

                Table firstTable = document.Tables.Add(para1.Range, groups.Count() + 1, 3, ref missing, ref missing);

                firstTable.Borders.Enable = 1;

                firstTable.Rows[1].Cells[1].Range.Text = "Название карты";
                firstTable.Rows[1].Cells[2].Range.Text = "Количество проданных экземпляров";
                firstTable.Rows[1].Cells[3].Range.Text = "Общая стоимость";

                for (int i = 0; i < groups.Count(); i++)
                {
                    firstTable.Rows[i + 2].Cells[1].Range.Text = groups.ElementAt(i).Key;
                    firstTable.Rows[i + 2].Cells[2].Range.Text = groups.ElementAt(i).Count().ToString();
                    firstTable.Rows[i + 2].Cells[3].Range.Text = groups.ElementAt(i).Sum(o => o.Ticket.Cost).ToString();
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

        public static void CreateTicketOrderDetailReport(string filename, List<TicketOrder> orders)
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
                    headerRange.Text = "Отчет по продажам";
                }

                //Add the footers into the document
                foreach (Microsoft.Office.Interop.Word.Section wordSection in document.Sections)
                {
                    //Get the footer range and add the footer details.
                    Microsoft.Office.Interop.Word.Range footerRange = wordSection.Footers[Microsoft.Office.Interop.Word.WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;
                    footerRange.Font.ColorIndex = Microsoft.Office.Interop.Word.WdColorIndex.wdBlue;
                    footerRange.Font.Size = 10;
                    footerRange.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    footerRange.Text = String.Format("Фитнесс центр, {0}", DateTime.Now.ToShortDateString());
                }

                //Add paragraph with Heading 1 style
                Microsoft.Office.Interop.Word.Paragraph para1 = document.Content.Paragraphs.Add(ref missing);
                para1.Range.Font.Size = 16;
                para1.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                para1.Range.Text = "Клубные карты, проданные за последний месяц";
                para1.Range.InsertParagraphAfter();

                Table firstTable = document.Tables.Add(para1.Range, orders.Count + 1, 4, ref missing, ref missing);

                firstTable.Borders.Enable = 1;

                firstTable.Rows[1].Cells[1].Range.Text = "Название карты";
                firstTable.Rows[1].Cells[2].Range.Text = "Владелец";
                firstTable.Rows[1].Cells[3].Range.Text = "Менеджер";
                firstTable.Rows[1].Cells[3].Range.Text = "Дата продажи";

                for (int i = 0; i < orders.Count; i++)
                {
                    firstTable.Rows[i + 2].Cells[1].Range.Text = orders[i].Ticket.Name;
                    firstTable.Rows[i + 2].Cells[2].Range.Text = orders[i].Client.FullName;
                    firstTable.Rows[i + 2].Cells[3].Range.Text = orders[i].Manager.FullName;
                    firstTable.Rows[i + 2].Cells[4].Range.Text = orders[i].OrderDate.ToShortDateString();
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

        public static void CreateTicketOrderReport(string filename, List<TicketOrder> orders)
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
                    headerRange.Text = "Отчет по продажам";
                }

                //Add the footers into the document
                foreach (Microsoft.Office.Interop.Word.Section wordSection in document.Sections)
                {
                    //Get the footer range and add the footer details.
                    Microsoft.Office.Interop.Word.Range footerRange = wordSection.Footers[Microsoft.Office.Interop.Word.WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;
                    footerRange.Font.ColorIndex = Microsoft.Office.Interop.Word.WdColorIndex.wdBlue;
                    footerRange.Font.Size = 10;
                    footerRange.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    footerRange.Text = String.Format("Фитнесс центр, {0}", DateTime.Now.ToShortDateString());
                }

                //Add paragraph with Heading 1 style
                Microsoft.Office.Interop.Word.Paragraph para1 = document.Content.Paragraphs.Add(ref missing);
                para1.Range.Font.Size = 16;
                para1.Range.ParagraphFormat.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                para1.Range.Text = "Отчет по продажам";
                para1.Range.InsertParagraphAfter();

                var groups = orders.GroupBy(o => o.Manager.FullName);

                Table firstTable = document.Tables.Add(para1.Range, groups.Count() + 1, 3, ref missing, ref missing);

                firstTable.Borders.Enable = 1;

                firstTable.Rows[1].Cells[1].Range.Text = "Менеджер";
                firstTable.Rows[1].Cells[2].Range.Text = "Количество проданных экземпляров";
                firstTable.Rows[1].Cells[3].Range.Text = "Общая стоимость";

                for (int i = 0; i < groups.Count(); i++)
                {
                    firstTable.Rows[i + 2].Cells[1].Range.Text = groups.ElementAt(i).Key;
                    firstTable.Rows[i + 2].Cells[2].Range.Text = groups.ElementAt(i).Count().ToString();
                    firstTable.Rows[i + 2].Cells[3].Range.Text = groups.ElementAt(i).Sum(o => o.Ticket.Cost).ToString();
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