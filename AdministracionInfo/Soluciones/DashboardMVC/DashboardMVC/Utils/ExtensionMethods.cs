using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace DashboardMVC.Utils
{
    public static class ExtensionMethods
    {
        public static int ToInt(this object obj)
        {
            return Convert.ToInt32(obj);
        }

        public static bool ToBool(this object obj)
        {
            return Convert.ToBoolean(obj);
        }

        public static char ToChar(this object obj)
        {
            return Convert.ToChar(obj);
        }

        public static decimal ToDecimal(this object obj)
        {
            var ui = new CultureInfo("es-PE");
            ui.NumberFormat = new NumberFormatInfo() { NumberDecimalSeparator = "." };
            return Convert.ToDecimal(obj, ui);
        }

        public static decimal? ToNullableDecimal(this decimal obj)
        {
            return (decimal?)obj;
        }

        public static DateTime ToDatetime(this string obj)
        {
            return DateTime.Parse(obj);
        }

        public static DateTime ToDatetime(this string obj, string format)
        {
            return DateTime.ParseExact(obj, format, null);
        }

        public static Nullable<int> ToNullableInt(this object obj)
        {
            return (int?)obj;
        }

        public static Nullable<DateTime> ToNullableDatetime(this DateTime date)
        {
            return (DateTime?)date;
        }
        public static string ToFullFormattedStringDate(this DateTime obj)
        {
            return obj.ToString("dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
        }

        public static string ToFileFormattedStringDate(this DateTime obj)
        {
            return obj.ToString("yyyyMMdd", CultureInfo.InvariantCulture);
        }

        public static string ToFormattedStringDate(this DateTime obj)
        {
            return obj.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
        }

        public static T GetValue<T>(this MySqlDataReader reader, string field)
        {
            return reader[field] == DBNull.Value ? default(T) : (T)reader[field];
        }
    }
}