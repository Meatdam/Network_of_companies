<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"
                encoding="windows-1251"
                indent="yes"/>

    <!-- Шаблон для форматирования даты -->
    <xsl:template name="format-date">
        <xsl:param name="date"/>
        <xsl:variable name="formattedDate">
            <xsl:choose>
                <xsl:when test="$date != ''">
                    <!-- Преобразование даты в нужный формат -->
                    <xsl:value-of select="substring($date, 9, 2)"/>.<xsl:value-of select="substring($date, 6, 2)"/>.
                    <xsl:value-of select="substring($date, 1, 4)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>N/A</xsl:text> <!-- Если дата пустая -->
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$formattedDate"/>
    </xsl:template>

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_NAME"/>
                </title>
                <style>
                    body {
                    font-family: Arial,
                    sans-serif;
                    }

                    .table-header {
                    background-color: #e6e6e6;
                    }

                    table {
                    border-collapse: collapse;
                    width: 100%;
                    background-color: white;

                    /* Важно! */
                    }

                    th,
                    td {
                    padding: 8px;
                    text-align: left;

                    }

                    .container {
                    width: 95%;
                    }

                    .table-container {
                    /* Контейнер для таблиц */
                    border-radius: 10px;
                    padding: 5px;
                    width: 100%;
                    background-color: #DAA520;
                    }

                    .table-container-2 {
                    /* Контейнер для таблиц */
                    border-radius: 10px;
                    padding: 5px;
                    width: 80%;
                    background-color: #DAA520;
                    }

                    .table-container-3 {
                    border-radius: 10px;
                    padding: 5px;
                    width: 50%;
                    background-color: #DAA520;
                    }

                    .table-container-4 {
                    border-radius: 10px;
                    padding: 5px;
                    width: 60%;
                    background-color: #DAA520;
                    }

                    .table-container-5 {
                    border-radius: 10px;
                    padding: 5px;
                    width: 95%;
                    background-color: #DAA520;
                    }

                    .table-container-6 {
                    border-radius: 10px;
                    padding: 5px;
                    width: 45%;
                    background-color: #DAA520;
                    }

                    .table-container-7 {
                    border-radius: 10px;
                    padding: 5px;
                    width: 80%;
                    background-color: #DAA520;
                    }

                    .table-container-8 {
                    border-radius: 10px;
                    padding: 5px;
                    width: 65%;
                    background-color: #DAA520;
                    }

                    .marketplace-header {
                    background-color: #DAA520;
                    box-sizing: border-box;
                    height: 100%;
                    font-size: 14px;
                    }

                    .marketplace-footer {
                    font-size: 14px;
                    background-color: #e6e6e6;
                    }

                    .text-style {
                    font-size: 14px;
                    padding_top: 10px;
                    padding_bottom: 10px;
                    background-color: #DAA520;
                    }

                    .marketplace-orange {
                    font-size: 14px;
                    background-color: #e6e6e6;
                    padding: 10px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    box-sizing: border-box;
                    height: 100%;
                    }

                    td {
                    position: relative;
                    }

                    .text {
                    width: 95%;
                    }

                    .date-column {
                    width: 10px;
                    }
                </style>

            </head>
            <body>


                <div class="text" style="color: #666666; text-align: right;">
                    <a href="https://grottbjorn.com/" style="color: #666666; text-decoration: none;">
                        <p>Акционерное общество Финансовое ателье ГроттБьерн
                            <br>Лицензия: № 166-02672-100000 от 01.11.2000 г.</br>
                        </p>
                    </a>
                </div>


                <div class="text_2" style="color: #666666;">
                    <a href="https://grottbjorn.com/" style="color: #666666; text-decoration: none;">
                        <img src="https://raw.githubusercontent.com/grottbjorn/styles-and-logos/refs/heads/main/test.png"
                             alt="Логотип"/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                    </a>
                </div>
                <div class="container" style="clear: both;">
                    <h3 style="text-align: center;">
                        <xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_NAME"/>
                    </h3>
                    <!--<h2>Дата документа: <xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_DATE"/></h2>
                    <h2>Время документа: <xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_TIME"/></h2>-->
                    <h5 style="text-align: center;">По сделкам и операциям за период:
                        <xsl:value-of select="/REPORT_DOC/Report/@PeriodBegin"/>
                        -
                        <xsl:value-of select="/REPORT_DOC/Report/@PeriodEnd"/>
                    </h5>
                    <h5 style="text-align: right; margin: 0;">Дата составления отчета:
                        <xsl:call-template name="format-date">
                            <xsl:with-param name="date" select="/REPORT_DOC/Report/@ReportDate"/>
                        </xsl:call-template>
                    </h5>
                    <!--<p>Начальная дата: <xsl:value-of select="/REPORT_DOC/Report/@PeriodBegin"/></p>
                    <p>Конечная дата: <xsl:value-of select="/REPORT_DOC/Report/@PeriodEnd"/></p>-->
                    <h5 style="text-align: right; margin: 0;">Клиент:
                        <xsl:value-of select="/REPORT_DOC/Report/@ClientName"/>
                    </h5>
                    <h5 style="text-align: right; margin: 0;">
                        <xsl:value-of select="/REPORT_DOC/Report/@AgreementBasis"/>
                    </h5>
                </div>
                <!-- 1.1. Ценные Бумаги: -->
                <xsl:variable name="executedSection" select="/REPORT_DOC/Sec/Securities[@Status='1']"/>
                <xsl:variable name="executedSection2" select="/REPORT_DOC/Sec/Securities[@Status='2']"/>
                <xsl:variable name="hasData" select="count($executedSection) + count($executedSection2) > 0"/>
                <xsl:if test="$hasData">
                    <h4>1.1. Ценные Бумаги:</h4>
                    <div class="table-container">
                        <table border="1">
                            <tr class="table-header">
                                <th rowspan="2" style="text-align: center;">Дата совершения сделки</th>
                                <th rowspan="2" style="text-align: center;">Время совершения сделки</th>
                                <th rowspan="2" style="text-align: center;">Дата исполнения сделки</th>
                                <th rowspan="2" style="text-align: center;">Биржевой номер сделки</th>
                                <th rowspan="2" style="text-align: center;">Инструмент</th>
                                <th rowspan="2" style="text-align: center;">Вид сделки</th>
                                <th rowspan="2" style="text-align: center;">Цена одной ЦБ</th>
                                <th rowspan="2" style="text-align: center;">Валюта цены</th>
                                <th rowspan="2" style="text-align: center;">Количество ЦБ, шт</th>
                                <th rowspan="2" style="text-align: center;">Сумма сделки в валюте сделки</th>
                                <th rowspan="2" style="text-align: center;">Сумма сделки в валюте платежа</th>
                                <th rowspan="2" style="text-align: center;">Валюта платежа</th>
                                <th rowspan="2" style="text-align: center;">Сумма НКД В валюте сделки</th>
                                <th rowspan="2" style="text-align: center;">Сумма НКД В валюте платежа</th>
                                <th rowspan="2" style="text-align: center;">Место заключения сделки</th>
                                <th rowspan="2" style="text-align: center;">Комиссия биржи</th>
                                <th colspan="2" style="text-align: center;">Комиссия брокера</th>
                                <th rowspan="2" style="text-align: center;">Уровень маржи</th>
                            </tr>
                            <tr class="table-header">
                                <th>Комиссия</th>
                                <th>в т.ч. НДС</th>
                            </tr>
                            <tr>
                                <td colspan="19" class="text-style"
                                    style="border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">
                                    <b>Исполненные сделки предыдущих дней:</b>
                                </td>
                            </tr>
                            <xsl:variable name="executedSec" select="/REPORT_DOC/Sec/Securities[@Status='1']"/>
                            <xsl:for-each select="$executedSec">
                                <tr>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Dateoftransaction"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Timeoftransaction"/>
                                    </td>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@ExecutionDate"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Exchangetradenumber"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Transactiontype"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@AmountCurrencyTransaction"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CurrencyPrices"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@Quantity"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@AmountCurrencyPayment"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@AmountCurrencyPayment"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PaymentCurrency"/>
                                    </td>

                                    <td style="text-align: right;">
                                        <xsl:value-of select="@AmountNKDCurrencyTransactions"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@AmountNCDCurrencyPayment"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PlaceDeals"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@ExchangeCommission"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@BrokerCommission"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@NDS"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@MarginLevel"/>
                                    </td>

                                </tr>
                            </xsl:for-each>
                            <tr class="marketplace-footer">
                                <td colspan="10" style="text-align: left;">
                                    <b>Итого: Количество сделок =
                                        <xsl:value-of select="count($executedSec)"/>
                                    </b>
                                </td>
                                <td colspan="3" style="text-align: left;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedSec/@AmountCurrencyPayment), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="2" style="text-align: left;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedSec/@AmountNCDCurrencyPayment), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: left;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedSec/@ExchangeCommission), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="3" style="text-align: left;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedSec/@BrokerCommission), '##0.00')"/>
                                    </b>
                                </td>

                            </tr>
                            <xsl:variable name="execut" select="/REPORT_DOC/Sec/Securities[@Status='2']"/>
                            <xsl:if test="$execut">
                                <tr>
                                    <td colspan="19" class="text-style"
                                        style="border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">
                                        <b>Незавершенные сделки к исполнению:</b>
                                    </td>
                                </tr>

                                <xsl:variable name="executedSec2" select="/REPORT_DOC/Sec/Securities[@Status='2']"/>
                                <xsl:for-each select="$executedSec2">
                                    <tr>
                                        <td>
                                            <xsl:call-template name="format-date">
                                                <xsl:with-param name="date" select="@Dateoftransaction"/>
                                            </xsl:call-template>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@Timeoftransaction"/>
                                        </td>
                                        <td>
                                            <xsl:call-template name="format-date">
                                                <xsl:with-param name="date" select="@ExecutionDate"/>
                                            </xsl:call-template>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@Exchangetradenumber"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@Asset"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@Transactiontype"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@AmountCurrencyTransaction"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@CurrencyPrices"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@Quantity"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@AmountCurrencyPayment"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@AmountCurrencyPayment"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@PaymentCurrency"/>
                                        </td>

                                        <td>
                                            <xsl:value-of select="@AmountNKDCurrencyTransactions"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@AmountNCDCurrencyPayment"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@PlaceDeals"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@ExchangeCommission"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@BrokerCommission"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@NDS"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@MarginLevel"/>
                                        </td>

                                    </tr>
                                </xsl:for-each>
                                <tr class="marketplace-footer">
                                    <td colspan="10" style="text-align: left;">
                                        <b>Итого: Количество сделок =
                                            <xsl:value-of select="count($executedSec2)"/>
                                        </b>
                                    </td>
                                    <td colspan="3" style="text-align: left;">
                                        <b>
                                            <xsl:value-of
                                                    select="format-number(sum($executedSec2/@AmountCurrencyPayment), '##0.00')"/>
                                        </b>
                                    </td>
                                    <td colspan="2" style="text-align: left;">
                                        <b>
                                            <xsl:value-of
                                                    select="format-number(sum($executedSec2/@AmountNCDCurrencyPayment), '##0.00')"/>
                                        </b>
                                    </td>
                                    <td colspan="1" style="text-align: left;">
                                        <b>
                                            <xsl:value-of
                                                    select="format-number(sum($executedSec2/@ExchangeCommission), '##0.00')"/>
                                        </b>
                                    </td>
                                    <td colspan="3" style="text-align: left;">
                                        <b>
                                            <xsl:value-of
                                                    select="format-number(sum($executedSec2/@BrokerCommission), '##0.00')"/>
                                        </b>
                                    </td>

                                </tr>
                            </xsl:if>
                            <tr class="marketplace-footer">
                                <td colspan="10" style="text-align: left;">
                                    <b>Всего: Количество сделок =
                                        <xsl:value-of select="count($executedSec)"/>
                                    </b>
                                </td>
                                <td colspan="3" style="text-align: left;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedSec/@AmountCurrencyPayment), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="2" style="text-align: left;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedSec/@AmountNCDCurrencyPayment), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: left;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedSec/@ExchangeCommission), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="3" style="text-align: left;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedSec/@BrokerCommission), '##0.00')"/>
                                    </b>
                                </td>

                            </tr>

                        </table>
                    </div>
                </xsl:if>

                <!-- 1.2. Срочные сделки: -->
                <xsl:variable name="executedFortDealsSum" select="/REPORT_DOC/FORTSDeals/FORTSDeal"/>
                <xsl:variable name="FortDealsSumData" select="count($executedFortDealsSum) > 0"/>
                <xsl:if test="$FortDealsSumData">
                    <h4>1.2. Срочные сделки:</h4>
                    <div class="table-container">
                        <table border="1">
                            <tr class="table-header">
                                <th rowspan="2" style="text-align: center;">Дата совершения сделки</th>
                                <th rowspan="2" style="text-align: center;">Время совершения сделки</th>
                                <th rowspan="2" style="text-align: center;">Биржевой номер сделки</th>
                                <th rowspan="2" style="text-align: center;">Инструмент</th>
                                <th rowspan="2" style="text-align: center;">Вид сделки</th>
                                <th rowspan="2" style="text-align: center;">Цена одного фьючерсного контракта / размер
                                    премии по
                                    опциону
                                </th>
                                <th rowspan="2" style="text-align: center;">Количество фьючерсных контрактов /
                                    опционов
                                </th>
                                <th rowspan="2" style="text-align: center;">Цена исполнения по опциону</th>
                                <th rowspan="2" style="text-align: center;">Сумма в валюте платежа</th>
                                <th rowspan="2" style="text-align: center;">Место заключения сделки</th>
                                <th rowspan="2" style="text-align: center;">Комиссия биржи</th>
                                <th colspan="2" style="text-align: center;">Комиссия брокера</th>
                            </tr>
                            <tr class="table-header">
                                <th>Комиссия</th>
                                <th>в т.ч. НДС</th>
                            </tr>
                            <xsl:variable name="executedFortDeals" select="/REPORT_DOC/FORTSDeals/FORTSDeal"/>
                            <xsl:for-each select="$executedFortDeals">
                                <tr>

                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Dateoftransaction"/>
                                        </xsl:call-template>
                                    </td>

                                    <td>
                                        <xsl:value-of select="@Timeoftransaction"/>
                                    </td>
                                    <td style="mso-number-format:\@;">
                                        <xsl:value-of select="@Exchangetradenumber"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Transactiontype"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Cost, '##0.0000') "/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Quantity, '##0')"/>
                                    </td>

                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@ExecutionPriceByOption = '0.0000'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@ExecutionPriceByOption"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>


                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@AmountCurrencyPayment = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@AmountCurrencyPayment"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PlaceDeals"/>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@ExchangeCommission = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@ExchangeCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@BrokerCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@NDS"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                            <tr class="marketplace-footer">
                                <td colspan="10" style="text-align: left;">
                                    <b>Всего: Количество сделок =
                                        <xsl:value-of select="count($executedFortDeals)"/>
                                    </b>
                                </td>
                                <td colspan="1" style="mso-number-format:\@; text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedFortDeals/@ExchangeCommission), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="1" style="mso-number-format:\@; text-align: right;">
                                    <b><xsl:choose>
                                        <xsl:when test="@BrokerCommission = '0.00'">
                                            <xsl:value-of select="''"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="format-number(sum($executedFortDeals/@BrokerCommission), '##0.00')"/>
                                        </xsl:otherwise>
                                    </xsl:choose></b>

                                </td>
                                <td colspan="1"></td>

                            </tr>

                        </table>
                    </div>
                </xsl:if>

                <!-- 1.3. Сделки РЕПО: -->
                <xsl:variable name="executedDeals1" select="/REPORT_DOC/REPODeals/REPODeal[@Status='1']"/>
                <xsl:variable name="executedDeals2" select="/REPORT_DOC/REPODeals/REPODeal[@Status='2']"/>
                <xsl:variable name="executedDealsData" select="count($executedDeals1) + count($executedDeals1) > 0"/>
                <xsl:if test="$executedDealsData">
                    <h4>1.3. Сделки РЕПО:</h4>
                    <div class="table-container">  <!-- Общий контейнер -->
                        <table border="1">

                            <tr class="table-header">
                                <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                                <th rowspan="2" style="text-align: center;">Дата заключения сделки</th>
                                <th rowspan="2" style="text-align: center;">Время заключения сделки</th>
                                <th rowspan="2" style="text-align: center;">Дата исполнения обязательств</th>
                                <th rowspan="2" style="text-align: center;">Номер биржевой сделки</th>
                                <th rowspan="2" style="text-align: center;">Код расчетов</th>
                                <th rowspan="2" style="text-align: center;">Срок расчетов, дн.</th>
                                <th rowspan="2" style="text-align: center;">Вид сделки (покупка, продажа, иной вид)</th>
                                <th rowspan="2" style="text-align: center;">Инструмент</th>
                                <th rowspan="2" style="text-align: center;">Цена одной ЦБ</th>
                                <th rowspan="2" style="text-align: center;">Валюта цены</th>
                                <th rowspan="2" style="text-align: center;">Количество ЦБ, шт.</th>
                                <th rowspan="2" style="text-align: center;">Сумма Сделки</th>
                                <th rowspan="2" style="text-align: center;">Валюта платежа</th>
                                <th rowspan="2" style="text-align: center;">Сумма НКД</th>
                                <th rowspan="2" style="text-align: center;">Место заключения сделки</th>
                                <th rowspan="2" style="text-align: center;">Комиссия биржи</th>
                                <th colspan="2" style="text-align: center;">Комиссия брокера</th>

                            </tr>
                            <tr class="table-header">
                                <th>Комиссия</th>
                                <th>в т.ч. НДС</th>
                            </tr>
                            <tr>
                                <td colspan="18" class="text-style"
                                    style="border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">
                                    <b>Исполненные сделки:</b>
                                </td>
                            </tr>
                            <!-- Цикл по сделкам со статусом "1" -->
                            <xsl:variable name="executedDeals" select="/REPORT_DOC/REPODeals/REPODeal[@Status='1']"/>
                            <xsl:for-each select="$executedDeals">
                                <tr>
                                    <!-- Вывод значений атрибутов -->
                                    <!-- Форматирование даты транзакции -->
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Dateoftransaction"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Timeoftransaction"/>
                                    </td>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@DateOfFulfillmentOfObligations"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Exchangetradenumber"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CalculationCode"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CalculationPeriod"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Transactiontype"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Cost, '#,##0.000000')"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CurrencyPrices"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="round(@Quantity)"/>
                                    </td>

                                    <td style="text-align: right;">
                                        <xsl:value-of select="@AmountCurrencyPayment"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PaymentCurrency"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@AmountNCDCurrencyPayment"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PlaceDeals"/>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@ExchangeCommission = '0.00' or @ExchangeCommission = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@ExchangeCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00' or @BrokerCommission = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@BrokerCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@NDS"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <tr class="marketplace-footer">
                                <td colspan="15" style="text-align: left;">
                                    <b>Итого: Количество сделок =
                                        <xsl:value-of select="count($executedDeals)"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedDeals/@ExchangeCommission), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00' or @BrokerCommission = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number(sum($executedDeals/@BrokerCommission), '##0.00')"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </b>

                                </td>
                                <td colspan="1"></td>

                            </tr>
                            <tr>
                                <td colspan="18" class="text-style"
                                    style="border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">
                                    <b>Незавершенные сделки к исполнению:</b>
                                </td>
                            </tr>
                            <!-- Цикл по сделкам со статусом "2" -->
                            <xsl:variable name="pendingDeals" select="/REPORT_DOC/REPODeals/REPODeal[@Status='2']"/>
                            <xsl:for-each select="$pendingDeals">
                                <tr>
                                    <!-- Вывод значений атрибутов -->
                                    <!-- Форматирование даты транзакции -->
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Dateoftransaction"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Timeoftransaction"/>
                                    </td>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@DateOfFulfillmentOfObligations"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Exchangetradenumber"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CalculationCode"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CalculationPeriod"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Transactiontype"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Cost, '#,##0.000000')"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CurrencyPrices"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="round(@Quantity)"/>
                                    </td>

                                    <td style="text-align: right;">
                                        <xsl:value-of select="@AmountCurrencyPayment"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PaymentCurrency"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@AmountNCDCurrencyPayment"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PlaceDeals"/>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@ExchangeCommission = '0.00' or @ExchangeCommission = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@ExchangeCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00' or @BrokerCommission = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@BrokerCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@NDS"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <tr class="marketplace-footer">
                                <td colspan="15" style="text-align: left;">
                                    <b>Итого: Количество сделок =
                                        <xsl:value-of select="count($pendingDeals)"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:choose>
                                            <xsl:when test="sum($pendingDeals/@ExchangeCommission) = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                        select="format-number(sum($pendingDeals/@ExchangeCommission), '##0.00')"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:choose>
                                            <xsl:when test="sum($pendingDeals/@BrokerCommission) = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                        select="format-number(sum($pendingDeals/@BrokerCommission), '##0.00')"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </b>
                                </td>
                                <td colspan="1"></td>
                            </tr>
                            <tr class="marketplace-footer">
                                <td colspan="15" style="text-align: left;">
                                    <b>Всего: Количество сделок =
                                        <xsl:value-of select="count($pendingDeals) + count($executedDeals)"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedDeals/@ExchangeCommission), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00' or @BrokerCommission = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number(sum($executedDeals/@BrokerCommission), '##0.00')"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </b>
                                </td>
                                <td colspan="1"></td>

                            </tr>
                        </table>
                    </div> <!-- Закрываем общий контейнер -->
                </xsl:if>

                <!-- 1.4. Иные операции(займ, мена и др): -->
                <xsl:variable name="executeOtherOperation" select="/REPORT_DOC/OtherOperations/OtherOperation"/>
                <xsl:variable name="executeOtherOperationData" select="count($executeOtherOperation) > 0"/>
                <xsl:if test="$executeOtherOperationData">
                    <h4>1.4. Иные операции(займ, мена и др):</h4>
                    <div class="table-container">  <!-- Общий контейнер -->
                        <table border="1">

                            <tr class="table-header">
                                <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                                <th rowspan="2" style="text-align: center;">Дата</th>
                                <th rowspan="2" style="text-align: center;">Время</th>
                                <th rowspan="2" style="text-align: center;">Инструмент</th>
                                <th rowspan="2" style="text-align: center;">Вид сделки</th>
                                <th rowspan="2" style="text-align: center;">Цена одной ЦБ</th>
                                <th rowspan="2" style="text-align: center;">Валюта цены</th>
                                <th rowspan="2" style="text-align: center;">Количество ЦБ, шт</th>
                                <th rowspan="2" style="text-align: center;">Сумма сделки</th>
                                <th rowspan="2" style="text-align: center;">Валюта платежа</th>
                                <th rowspan="2" style="text-align: center;">Сумма НКД</th>
                                <th rowspan="2" style="text-align: center;">Место заключение сделки</th>
                                <th rowspan="2" style="text-align: center;">Комиссия биржы</th>
                                <th colspan="2" style="text-align: center;">Комиссия брокера</th>
                            </tr>
                            <tr class="table-header">
                                <th>Комиссия</th>
                                <th>в т.ч. НДС</th>
                            </tr>
                            <xsl:variable name="executedFortDeals" select="/REPORT_DOC/OtherOperations/OtherOperation"/>
                            <xsl:for-each select="$executedFortDeals">
                                <tr>
                                    <td>

                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Dateoftransaction"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Timeoftransaction"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Transactiontype"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@Cost = '0.00' or @Cost = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@Cost"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CurrencyPrices"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@Quantity = '0.00' or @Quantity = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number(@Quantity, '##0.')"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when
                                                    test="@AmountCurrencyPayment = '0.00' or @AmountCurrencyPayment = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@AmountCurrencyPayment"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PaymentCurrency"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@NKD = '0.00' or @NKD = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@NKD"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PlaceDeals"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@ExchangeCommission = '0.00' or @ExchangeCommission = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@ExchangeCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00' or @BrokerCommission = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@BrokerCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@NDS = '0.00' or @NDS = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@NDS"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                </xsl:if>


                <!-- 1.6. Инструменты валютного рынка и рынка драгоценных металлов: -->
                <xsl:variable name="executedMetalMarkets"
                              select="/REPORT_DOC/AssetsForeignMetalMarkets/AssetForeignMetalMarkets[@Status='1']"/>
                 <xsl:variable name="executedMetalMarkets2"
                              select="/REPORT_DOC/AssetsForeignMetalMarkets/AssetForeignMetalMarkets2[@Status='3']"/>
                <xsl:variable name="executedMetalMarketsData" select="count($executedMetalMarkets) + count($executedMetalMarkets2) > 0"/>
                <xsl:if test="$executedMetalMarketsData">
                    <h4>1.6. Инструменты валютного рынка и рынка драгоценных металлов:</h4>
                    <div class="table-container">
                        <table border="1">
                            <tr class="table-header">
                                <th rowspan="2" style="text-align: center;">Дата совершения сделки</th>
                                <th rowspan="2" style="text-align: center;">Время совершения сделки</th>
                                <th rowspan="2" style="text-align: center;">Дата исполнения сделки</th>
                                <th rowspan="2" style="text-align: center;">Биржевой номер сделки</th>
                                <th rowspan="2" style="text-align: center;">Инструмент</th>
                                <th rowspan="2" style="text-align: center;">Тип сделки</th>
                                <th rowspan="2" style="text-align: center;">ПФИ</th>
                                <th rowspan="2" style="text-align: center;">Вид сделки</th>
                                <th rowspan="2" style="text-align: center;">Курс сделки</th>
                                <th rowspan="2" style="text-align: center;">Валюта лота</th>
                                <th rowspan="2" style="text-align: center;">Объем в валюте лота, лот</th>
                                <th rowspan="2" style="text-align: center;">Сопряженная валюта</th>
                                <th rowspan="2" style="text-align: center;">Объем в сопряженной валюте</th>
                                <th rowspan="2" style="text-align: center;">Место заключение сделки</th>
                                <th rowspan="2" style="text-align: center;">Комиссия биржи</th>
                                <th colspan="2" style="text-align: center;">Комиссия брокера</th>
                            </tr>

                            <tr class="table-header">
                                <th style="text-align: center;">Комиссия</th>
                                <th style="text-align: center;">в т.ч. НДС</th>
                            </tr>
                            <tr>
                                <td colspan="17" class="text-style"
                                    style="border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">
                                    <b>Исполненные сделки:</b>
                                </td>
                            </tr>
                            <!-- Цикл по сделкам со статусом "1" -->
                            <xsl:variable name="executedMetal"
                                          select="/REPORT_DOC/AssetsForeignMetalMarkets/AssetForeignMetalMarkets[@Status='1']"/>
                            <xsl:for-each select="$executedMetal">
                                <tr>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Dateoftransaction"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Timeoftransaction"/>
                                    </td>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@DateOfFulfillmentOfObligations"/>
                                        </xsl:call-template>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Exchangetradenumber"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@TypeDeals"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Derivatives"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Transactiontype"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Cost, '##0.000000')"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CurrencyPrices"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Quantity, '##0.')"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PaymentCurrency"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@AmountCurrencyPayment"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PlaceDeals"/>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@ExchangeCommission = '0.00' or @Cost = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@ExchangeCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00' or @Cost = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@BrokerCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="@NDS = '0' ">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@NDS"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>

                            </xsl:for-each>
                            <tr class="marketplace-footer">
                                <td colspan="14" style="text-align: left;">
                                    <b>Итого: Количество сделок =
                                        <xsl:value-of select="count($executedMetal)"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedMetal/@ExchangeCommission), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                   <b> <xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00' or @Cost = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number(sum($executedMetal/@BrokerCommission), '##0.00')"/>
                                            </xsl:otherwise>
                                   </xsl:choose></b>

                                </td>
                                <td colspan="1"></td>

                            </tr>
                            <tr>
                                <td colspan="17" class="text-style"
                                    style="border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">
                                    <b>Незавершенные сделки к исполнению:</b>
                                </td>
                            </tr>
                             <xsl:variable name="executedMetal2"
                                          select="/REPORT_DOC/AssetsForeignMetalMarkets/AssetForeignMetalMarkets[@Status='3']"/>
                            <xsl:for-each select="$executedMetal2">
                                <tr>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Dateoftransaction"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Timeoftransaction"/>
                                    </td>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@DateOfFulfillmentOfObligations"/>
                                        </xsl:call-template>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Exchangetradenumber"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@TypeDeals"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Derivatives"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Transactiontype"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Cost, '##0.000000')"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@CurrencyPrices"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Quantity, '##0.')"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PaymentCurrency"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@AmountCurrencyPayment"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PlaceDeals"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@ExchangeCommission = '0.00' or @Cost = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@ExchangeCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00' or @Cost = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@BrokerCommission"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="@NDS = '0'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@NDS"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>

                            </xsl:for-each>
                            <tr class="marketplace-footer">
                                <td colspan="17" style="text-align: left;">
                                    <b>Итого: Количество сделок =
                                        <xsl:value-of select="count($executedMetal2)"/>
                                    </b>
                                </td>
                            </tr>
                            <tr class="marketplace-footer">
                                <td colspan="14" style="text-align: left;">
                                    <b>Всего: Количество сделок =
                                        <xsl:value-of select="count($executedMetal) + count($executedMetal2)"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedMetal/@ExchangeCommission), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b><xsl:choose>
                                            <xsl:when test="@BrokerCommission = '0.00' or @Cost = 0">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number(sum($executedMetal/@BrokerCommission), '##0.00')"/>
                                            </xsl:otherwise>
                                    </xsl:choose></b>

                                </td>
                                <td colspan="1"></td>

                            </tr>
                        </table>
                    </div>
                </xsl:if>

                <!-- 3.1. Инофрмация об операциях с ЦБ: -->
                <xsl:variable name="executeTransactionsSecurities"
                              select="/REPORT_DOC/TransactionsSecurities/TransactionsSecurities"/>
                <xsl:variable name="executeTransactionsSecuritiesData"
                              select="count($executeTransactionsSecurities) > 0"/>
                <xsl:if test="$executeTransactionsSecuritiesData">
                    <h4>3.1. Инофрмация об операциях с ЦБ:</h4>
                    <div class="table-container">
                        <table border="1">
                            <tr class="table-header">
                                <th rowspan="2" style="text-align: center;">Дата совершения операции</th>
                                <th rowspan="2" style="text-align: center;">Место учета ЦБ</th>
                                <th rowspan="2" style="text-align: center;">Вид, тип, форма выпуска, транш, серия</th>
                                <th rowspan="2" style="text-align: center;">Наименование операции</th>
                                <th colspan="2" style="text-align: center;">Количество ЦБ</th>
                            </tr>
                            <tr class="table-header">
                                <th style="text-align: center;">Зачислено</th>
                                <th style="text-align: center;">Списано</th>
                            </tr>
                            <xsl:variable name="executeSecurities"
                                          select="/REPORT_DOC/TransactionsSecurities/TransactionsSecurities"/>
                            <xsl:for-each select="$executeSecurities">
                                <tr>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Dateoftransaction"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@PlaceRegistration"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@NameOperation"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Enrolled, '##0.')"/>
                                    </td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="@Writtenoff = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@Writtenoff"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>

                                </tr>
                            </xsl:for-each>
                            <tr class="marketplace-footer">
                                <td colspan="4" style="text-align: left;">
                                    <b>Итого:

                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executeSecurities/@Enrolled), '##0.')"/>
                                    </b>
                                </td>
                                <td colspan="1"></td>

                            </tr>
                        </table>
                    </div>
                </xsl:if>

                <!-- 3.2. Информация о состоянии портфеля ценных бумаг: -->
                <xsl:variable name="executePortfolio"
                              select="/REPORT_DOC/StateSecuritiesPortfolio/StateSecuritiesPortfolio"/>
                <xsl:variable name="executePortfolioData" select="count($executePortfolio) > 0"/>
                <xsl:if test="$executePortfolioData">
                    <h4>3.2. Информация о состоянии портфеля ценных бумаг:</h4>
                    <div class="table-container-2">
                        <table border="1">
                            <tr class="table-header">
                                <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                                <th rowspan="2" style="text-align: center;">Инструмент</th>
                                <th rowspan="2" style="text-align: center;">Место учета ЦБ</th>
                                <th colspan="3" style="text-align: center;">Остаток на начало отчетного периода</th>
                                <th rowspan="2" style="text-align: center;">Зачислено</th>
                                <th rowspan="2" style="text-align: center;">Списано</th>
                                <th colspan="4" style="text-align: center;">Остаток на конец отчетного периода</th>
                                <th rowspan="2" style="text-align: center;">Валюта платежа</th>
                                <th rowspan="2" style="text-align: center;">Плановый исходящий остаток с учетом
                                    обязательств, шт.
                                </th>
                            </tr>
                            <tr class="table-header">

                                <th style="text-align: center;">Всего</th>
                                <th style="text-align: center;">Блокировано</th>
                                <th style="text-align: center;">Доступно</th>

                                <th style="text-align: center;">Всего</th>
                                <th style="text-align: center;">Блокировано</th>
                                <th style="text-align: center;">Доступно</th>
                                <th style="text-align: center;">Рыночная цена</th>

                            </tr>

                            <!-- Цикл по сделкам -->
                            <xsl:for-each select="/REPORT_DOC/StateSecuritiesPortfolio/StateSecuritiesPortfolio">
                                <tr>
                                    <!-- Вывод значений атрибутов -->
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@PlaceRegistration"/>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@RemainderStart = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@RemainderStart"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td></td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@RemainderStart = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@RemainderStart"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@Enrolled = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@Enrolled"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@Writtenoff = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@Writtenoff"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">

                                        <xsl:choose>
                                            <xsl:when test="@RemainderEnd = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@RemainderEnd"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td></td>
                                    <td style="mso-number-format:\@; text-align: right;">

                                        <xsl:choose>
                                            <xsl:when test="@RemainderEnd = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@RemainderEnd"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@MarketPrice = ''">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number(@MarketPrice, '##0.0000')"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@PaymentCurrency"/>
                                    </td>
                                    <td style="mso-number-format:\@; text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@PlannedRef = '0.00'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@PlannedRef"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>


                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                </xsl:if>

                <!-- 3.3. Информация об открытых позициях по фьючерсным контрактам и опционам: -->
                <xsl:variable name="executedFuturesOptions"
                              select="/REPORT_DOC/OpenPositionsFuturesOptions/OpenPositionsFuturesOptions"/>
                <xsl:variable name="executedFuturesOptionsData" select="count($executedFuturesOptions) > 0"/>
                <xsl:if test="$executedFuturesOptionsData">
                    <h4>3.3. Информация об открытых позициях по фьючерсным контрактам и опционам:</h4>
                    <div class="table-container-3">
                        <table border="1">
                            <tr class="table-header">
                                <th style="text-align: center;">Инструмент</th>
                                <th style="text-align: center;">Остаток на начало отчетного периода</th>
                                <th style="text-align: center;">Покупка</th>
                                <th style="text-align: center;">Продажа</th>
                                <th style="text-align: center;">Остаток на конец отчетного периода</th>
                                <th style="text-align: center;">Начальная маржа</th>
                                <th style="text-align: center;">Оценка опционов</th>
                            </tr>
                            <xsl:variable name="executedFutures"
                                          select="/REPORT_DOC/OpenPositionsFuturesOptions/OpenPositionsFuturesOptions"/>
                            <xsl:for-each select="$executedFutures">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@RemainderStart = '0'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@RemainderStart"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@Purchase"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@Sale"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:choose>
                                            <xsl:when test="@RemainderEnd = '0'">
                                                <xsl:value-of select="''"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@RemainderEnd"/>
                                            </xsl:otherwise>
                                        </xsl:choose>

                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@Margin"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="''"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                        </table>
                    </div>
                </xsl:if>

                <!-- 3.4. Информация по обязательствам валютного рынка и рынка драгоценных металлов: -->
                <xsl:variable name="executedForeignMetalsMarket"
                              select="/REPORT_DOC/LiabilitiesForeignMetalsMarket/LiabilitiesForeignMetalsMarket"/>
                <xsl:variable name="executedForeignMetalsMarketData" select="count($executedForeignMetalsMarket) > 0"/>
                <xsl:if test="$executedForeignMetalsMarketData">
                <h4>3.4. Информация по обязательствам валютного рынка и рынка драгоценных металлов:</h4>
                <div class="table-container-3">
                    <table border="1">
                        <tr class="table-header">
                            <th style="text-align: center;">Дата исполнения</th>
                            <th style="text-align: center;">Валюта</th>
                            <th style="text-align: center;">Нетто-требование</th>
                            <th style="text-align: center;">Нетто-обязательство</th>
                            <th style="text-align: center;">Итого</th>
                            <th style="text-align: center;">Курс</th>
                            <th style="text-align: center;">Итого по курсу</th>
                        </tr>
                        <xsl:variable name="LiabilitiesForeignMetals"
                                      select="/REPORT_DOC/LiabilitiesForeignMetalsMarket/LiabilitiesForeignMetalsMarket"/>
                        <xsl:for-each select="$LiabilitiesForeignMetals">
                            <tr>
                                <td>
                                    <xsl:call-template name="format-date">
                                        <xsl:with-param name="date" select="@ExecutionDate"/>
                                    </xsl:call-template>
                                </td>
                                <td style="text-align: center;">
                                    <xsl:value-of select="@Asset"/>
                                </td>
                                <td style="text-align: right;">
                                    <xsl:choose>
                                        <xsl:when test="@Requirements = '0.000000'">
                                            <xsl:value-of select="''"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="format-number(@Requirements, '##0.00')"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td style="text-align: right;">
                                    <xsl:choose>
                                        <xsl:when test="@Liabilities = '0.000000'">
                                            <xsl:value-of select="''"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="format-number(@Liabilities, '##0.00')"/>
                                        </xsl:otherwise>
                                    </xsl:choose>

                                </td>
                                <td style="text-align: right;">
                                    <xsl:value-of select="format-number(@Total, '##0.00')"/>
                                </td>
                                <td style="text-align: right;">
                                    <xsl:value-of select="format-number(@Quotation, '##0.0000')"/>
                                </td>
                                <td style="text-align: right;">
                                    <xsl:value-of select="@CostRUR"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
                </xsl:if>


                <!-- 3.5. Информация по обязательствам фондового рынка: -->
                <xsl:variable name="executedStockMarketObligation"
                              select="/REPORT_DOC/StockMarketObligations/StockMarketObligation"/>
                <xsl:variable name="executedStockMarketObligationData"
                              select="count($executedStockMarketObligation) > 0"/>
                <xsl:if test="$executedStockMarketObligationData">
                    <h4>3.5. Информация по обязательствам фондового рынка:</h4>
                    <div class="table-container-3">
                        <table border="1">
                            <tr class="table-header">
                                <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                                <th style="text-align: center;">Дата Исполнения</th>
                                <th style="text-align: center;">Валюта</th>
                                <th style="text-align: center;">Инструмент</th>
                                <th style="text-align: center;">Требования</th>
                                <th style="text-align: center;">Обязательство</th>
                                <th style="text-align: center;">Итого</th>

                            </tr>

                            <!-- Цикл по сделкам -->
                            <xsl:for-each select="/REPORT_DOC/StockMarketObligations/StockMarketObligation">
                                <tr>
                                    <!-- Вывод значений атрибутов -->
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@ExecutionDate"/>
                                        </xsl:call-template>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Currency"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Requirements, '##0.00')"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Liabilities, '##0.00')"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Total, '##0.00')"/>
                                    </td>


                                </tr>
                            </xsl:for-each>

                        </table>
                    </div>
                </xsl:if>

                <!-- 3.10. Оценка рублевой составляющей средств обеспечения: -->
                <xsl:variable name="executedEvaluationrublecol"
                              select="/REPORT_DOC/Evaluationrublecollateral/Evaluationrublecollateral"/>
                <xsl:variable name="executedEvaluationrublecolData"
                              select="count($executedEvaluationrublecol) > 0"/>
                <xsl:if test="$executedEvaluationrublecolData">
                <h4>3.10. Оценка рублевой составляющей средств обеспечения:</h4>
                <div class="table-container-8">
                    <table border="1">
                        <tr class="table-header">
                            <th style="text-align: center;">Дата</th>
                            <th style="text-align: center;">Рублевая составляющая средств обеспечения</th>
                            <th style="text-align: center;">Ставка RUONIA</th>
                            <th style="text-align: center;">Выплаченные проценты на рублевый остаток средств
                                обеспечения
                            </th>
                        </tr>
                        <xsl:for-each select="/REPORT_DOC/Evaluationrublecollateral/Evaluationrublecollateral">
                            <tr>
                                <!-- Вывод значений атрибутов -->
                                <td>
                                    <xsl:call-template name="format-date">
                                        <xsl:with-param name="date" select="@Date"/>
                                    </xsl:call-template>
                                </td>
                                <td style="text-align: right;">
                                    <xsl:value-of select="@Requirements"/>
                                </td>
                                <td style="mso-number-format:\@; text-align: right;">
                                    <xsl:value-of select="@Bid"/>
                                </td>
                                <td style="mso-number-format:\@; text-align: right;">
                                    <xsl:value-of select="@Payments"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
                </xsl:if>


                <!-- 5.3. Расчет вариационной маржи: -->
                <xsl:variable name="executedCalculationVariationMargin"
                              select="/REPORT_DOC/CalculationVariationMargin/CalculationVariationMargin"/>
                <xsl:variable name="executedCalculationVariationMarginData"
                              select="count($executedCalculationVariationMargin) > 0"/>
                <xsl:if test="$executedCalculationVariationMarginData">
                    <h4>5.3. Расчет вариационной маржи:</h4>
                    <div class="table-container-3">
                        <table border="1">
                            <tr class="table-header">
                                <th style="text-align: center;">Дата</th>
                                <th style="text-align: center;">Инструмент</th>
                                <th style="text-align: center;">Расчетная цена</th>
                                <th style="text-align: center;">Зачислено, руб</th>
                                <th style="text-align: center;">Списано, руб</th>
                                <th style="text-align: center;">Итого</th>
                            </tr>

                            <xsl:variable name="executedVariationMargin"
                                          select="/REPORT_DOC/CalculationVariationMargin/CalculationVariationMargin"/>
                            <xsl:for-each select="$executedVariationMargin">
                                <tr>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Date"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Asset"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@EstimatedPrice, '##0.000000')"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Enrolled, '##0.00')"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Writtenoff, '##0.00')"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="format-number(@Total, '##0.00')"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <tr class="marketplace-footer">
                                <td colspan="3" style="text-align: left;">
                                    <b>Итого:

                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedVariationMargin/@Enrolled), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedVariationMargin/@Writtenoff), '##0.00')"/>
                                    </b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedVariationMargin/@Total), '##0.00')"/>
                                    </b>
                                </td>

                            </tr>
                        </table>
                    </div>
                </xsl:if>


                <!-- 5.4. Информация о движении денежных средств: -->
                <xsl:variable name="executedCashFlow1"
                              select="/REPORT_DOC/CashFlow/CashFlow"/>
                <xsl:variable name="executedCashFlow1Data" select="count($executedCashFlow1) > 0"/>
                <xsl:if test="$executedCashFlow1Data">
                    <h4>5.4. Информация о движении денежных средств:</h4>
                    <div class="table-container-4">
                        <table border="1">
                            <tr class="table-header">
                                <th style="text-align: center;">Дата совершения операции</th>
                                <th style="text-align: center;">Наименование операции</th>
                                <th style="text-align: center;">Валюта операции</th>
                                <th style="text-align: center;">Приход</th>
                                <th style="text-align: center;">Расход</th>
                            </tr>

                            <xsl:for-each select="/REPORT_DOC/CashFlow/CashFlow">
                                <tr>
                                    <td>
                                        <xsl:call-template name="format-date">
                                            <xsl:with-param name="date" select="@Date"/>
                                        </xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@NameOperation"/>
                                    </td>
                                    <td style="text-align: center;">
                                        <xsl:value-of select="@Currency"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@Receipt"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@Expense"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                            <tr>
                                <td colspan="5" class="text-style"
                                    style="border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">
                                    <b>В разрезе валют:</b>
                                </td>
                            </tr>

                            <xsl:for-each
                                    select="//REPORT_DOC/CashFlow/CashFlow[not(@Currency = preceding-sibling::CashFlow/@Currency)]">
                                <xsl:variable name="currentCurrency" select="@Currency"/>
                                <xsl:variable name="cashFlowForCurrency"
                                              select="//REPORT_DOC/CashFlow/CashFlow[@Currency=$currentCurrency]"/>
                                <xsl:variable name="totalReceipt" select="sum($cashFlowForCurrency/@Receipt)"/>
                                <xsl:variable name="totalExpense" select="sum($cashFlowForCurrency/@Expense)"/>

                                <tr>
                                    <td colspan="2" class="marketplace-footer"></td>
                                    <td colspan="1" class="marketplace-footer" style="text-align: center;">
                                        <b>
                                            <xsl:value-of select="$currentCurrency"/>
                                        </b>
                                    </td>
                                    <td colspan="1" class="marketplace-footer" style="text-align: right;">
                                        <b>
                                            <xsl:value-of select="format-number($totalReceipt, '##0.00')"/>
                                        </b>
                                    </td>
                                    <td colspan="1" class="marketplace-footer" style="text-align: right;">
                                        <b>
                                            <xsl:value-of select="format-number($totalExpense, '##0.00')"/>
                                        </b>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                </xsl:if>


                <!-- 5.5. Информация об остатках денежных средств: -->
                <xsl:variable name="executedCashFlow"
                              select="/REPORT_DOC/CashFlow/CashFlow"/>
                <xsl:variable name="executedCashFlowData" select="count($executedCashFlow) > 0"/>
                <xsl:if test="$executedCashFlowData">
                    <h4>5.5. Информация об остатках денежных средств:</h4>
                    <div class="table-container-5">
                        <!-- Создаем таблицу -->
                        <table border="1" style="box-sizing: border-box;">
                            <tr class="table-header">
                                <!-- Заголовки таблицы  -->
                                <th rowspan="2" style="text-align: center;">Дата (Формирования)</th>
                                <th rowspan="2" style="text-align: center;">Валюта</th>
                                <th colspan="4" style="text-align: center;">Начало отчетного периода</th>
                                <th rowspan="2" style="text-align: center;">Приход</th>
                                <th rowspan="2" style="text-align: center;">Расход</th>
                                <th colspan="5" style="text-align: center;">Конец отчетного периода</th>
                                <th rowspan="2" style="text-align: center;">Курс</th>
                                <th rowspan="2" style="text-align: center;">Остаток на конец по курсу</th>
                                <th rowspan="2" style="text-align: center;">Плановый исходящий остаток с учетом
                                    обязательств
                                </th>
                            </tr>
                            <tr class="table-header">
                                <th style="text-align: center;">Остаток</th>
                                <th style="text-align: center;">Задолжность перед Брокером</th>
                                <th style="text-align: center;">Начальная маржа</th>
                                <th style="text-align: center;">Сумма средств свободная от обязательств</th>

                                <th style="text-align: center;">Остаток</th>
                                <th style="text-align: center;">Задолжность перед брокером</th>
                                <th style="text-align: center;">Начальная маржа</th>
                                <th style="text-align: center;">Сумма средств свободная от обязательств</th>
                                <th style="text-align: center;">Уведомление: Сумма к внесению</th>
                            </tr>
                            <tr>
                                <td colspan="16" class="text-style"
                                    style="border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">
                                    <b>В разрезе площадок:</b>
                                </td>

                            </tr>
                            <!-- Группировка по Marketplace -->
                            <xsl:for-each
                                    select="//CashMarkets[not(@Marketplace = preceding-sibling::CashMarkets/@Marketplace)]">
                                <xsl:variable name="currentMarketplace" select="@Marketplace"/>
                                <xsl:variable name="dataForMarketplace"
                                              select="//CashMarkets[@Marketplace = $currentMarketplace]"/>

                                <!-- Проверка на наличие данных для текущего Marketplace -->
                                <xsl:if test="$dataForMarketplace">
                                    <xsl:variable name="currentTotalSum" select="$dataForMarketplace[1]/@TotalSum"/>

                                    <!-- Заголовок для каждого Marketplace -->
                                    <tr>
                                        <td colspan="16" class="marketplace-footer"
                                            style="border-left: 2px solid black; border-right: 2px solid black;">
                                            <b>
                                                <xsl:value-of select="$currentMarketplace"/>
                                            </b>
                                        </td>
                                    </tr>
                                    <!-- Вывод данных для текущего Marketplace -->
                                    <xsl:for-each select="$dataForMarketplace">
                                        <tr>
                                            <!-- Вывод значений атрибутов -->
                                            <td>
                                                <xsl:call-template name="format-date">
                                                    <xsl:with-param name="date" select="@Date"/>
                                                </xsl:call-template>
                                            </td>
                                            <td style="text-align: center;">
                                                <xsl:value-of select="@Currency"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@RemainderStart"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@DebtStart"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@MarginStart"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@FreeBalanceStart"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="format-number(@Enrolled, '##0.00')"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="format-number(@Writtenoff, '##0.00')"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@Total"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@DebtEnd"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@MarginEND"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@AmountFree"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@AmountDeposited"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@Quotation"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@CostRUR"/>
                                            </td>
                                            <td style="text-align: right;">
                                                <xsl:value-of select="@PlannedClosing"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                    <tr class="marketplace-header">
                                        <td colspan="14">
                                            <b>Итого по площадке:</b>
                                        </td>
                                        <td colspan="1" style="text-align: right;">
                                            <xsl:choose>
                                                <xsl:when test="$currentTotalSum = '0.00' or $currentTotalSum = 0">
                                                    <xsl:value-of select="''"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <b>
                                                        <xsl:value-of select="$currentTotalSum"/>
                                                    </b>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td colspan="1"></td>


                                    </tr>
                                </xsl:if>
                            </xsl:for-each>

                            <tr class="marketplace-footer">

                                <td colspan="16"
                                    style="border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">
                                    <b>В разрезе валют:</b>
                                </td>

                            </tr>

                            <xsl:for-each
                                    select="//CashMarkets[not(@Currency = preceding-sibling::CashMarkets/@Currency)]">
                                <xsl:variable name="currentCurrency" select="@Currency"/>
                                <xsl:variable name="cashMarketsForGroup"
                                              select="//CashMarkets[@Currency=$currentCurrency]"/>

                                <xsl:variable name="totalRemainderStart"
                                              select="sum($cashMarketsForGroup/@RemainderStart)"/>
                                <xsl:variable name="totalDebtStart" select="sum($cashMarketsForGroup/@DebtStart)"/>
                                <xsl:variable name="totalMarginStart" select="sum($cashMarketsForGroup/@MarginStart)"/>
                                <xsl:variable name="totalFreeBalanceStart"
                                              select="sum($cashMarketsForGroup/@FreeBalanceStart)"/>
                                <xsl:variable name="totalEnrolled" select="sum($cashMarketsForGroup/@Enrolled)"/>
                                <xsl:variable name="totalWrittenoff" select="sum($cashMarketsForGroup/@Writtenoff)"/>
                                <xsl:variable name="totalTotal" select="sum($cashMarketsForGroup/@Total)"/>
                                <xsl:variable name="totalDebtEnd" select="sum($cashMarketsForGroup/@DebtEnd)"/>
                                <xsl:variable name="totalMarginEND" select="sum($cashMarketsForGroup/@MarginEND)"/>
                                <xsl:variable name="totalAmountFree" select="sum($cashMarketsForGroup/@AmountFree)"/>
                                <xsl:variable name="totalAmountDeposited"
                                              select="sum($cashMarketsForGroup/@AmountDeposited)"/>

                                <!-- Средний курс (если нужно) -->
                                <xsl:variable name="avgQuotation">
                                    <xsl:choose>
                                        <xsl:when test="count($cashMarketsForGroup) > 0">
                                            <xsl:value-of
                                                    select="sum($cashMarketsForGroup/@Quotation) div count($cashMarketsForGroup)"/>
                                        </xsl:when>
                                        <xsl:otherwise>0</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>

                                <xsl:variable name="totalCostRUR" select="sum($cashMarketsForGroup/@CostRUR)"/>
                                <xsl:variable name="totalPlannedClosing"
                                              select="sum($cashMarketsForGroup/@PlannedClosing)"/>
                                <xsl:if test="$cashMarketsForGroup">
                                    <tr>
                                        <td>
                                            <xsl:call-template name="format-date">
                                                <xsl:with-param name="date" select="$cashMarketsForGroup[1]/@Date"/>
                                            </xsl:call-template>
                                        </td>
                                        <td style="text-align: center;">
                                            <b>
                                                <xsl:value-of select="$currentCurrency"/>
                                            </b>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalRemainderStart, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalDebtStart, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalMarginStart, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalFreeBalanceStart, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalEnrolled, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalWrittenoff, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalTotal, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalDebtEnd, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalMarginEND, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalAmountFree, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalAmountDeposited, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="$avgQuotation"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalCostRUR, '##0.00')"/>
                                        </td>
                                        <td style="text-align: right;">
                                            <xsl:value-of select="format-number($totalPlannedClosing, '##0.00')"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </table>
                    </div>
                </xsl:if>


                <!-- 6.1. Расшифровка комиссий: -->
                <xsl:variable name="executedCommissionType"
                              select="/REPORT_DOC/Commissions/CommissionType"/>
                <xsl:variable name="executedCommissionTypeData" select="count($executedCommissionType) > 0"/>
                <xsl:if test="$executedCommissionTypeData">
                    <h4>6.1. Расшифровка комиссий:</h4>
                    <div class="table-container-6">
                        <table border="1">
                            <tr class="table-header">
                                <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                                <th>Вид комисии</th>
                                <th>Сумма, руб.</th>
                            </tr>

                            <!-- Цикл по сделкам -->
                            <xsl:variable name="executedCommission" select="/REPORT_DOC/Commissions/CommissionType"/>
                            <xsl:for-each select="$executedCommission">
                                <tr>
                                    <!-- Вывод значений атрибутов -->
                                    <td>
                                        <xsl:value-of select="@CommissionType"/>
                                    </td>
                                    <td style="text-align: right;">
                                        <xsl:value-of select="@CommissionSum"/>
                                    </td>

                                </tr>
                            </xsl:for-each>
                            <tr class="marketplace-footer">
                                <td colspan="1" style="text-align: left;">
                                    <b>Итого:</b>
                                </td>
                                <td colspan="1" style="text-align: right;">
                                    <b>
                                        <xsl:value-of
                                                select="format-number(sum($executedCommission/@CommissionSum), '##0.00')"/>
                                    </b>
                                </td>


                            </tr>
                        </table>
                    </div>
                </xsl:if>


                <!-- 7.1. Расшифровка кодов ценных бумаг: -->
                <xsl:variable name="executedSecurityCodes"
                              select="/REPORT_DOC/SecurityCodes/SecurityCodes"/>
                <xsl:variable name="executedSecurityCodesData" select="count($executedSecurityCodes) > 0"/>
                <xsl:if test="$executedSecurityCodesData">
                    <h4>7.1. Расшифровка кодов ценных бумаг:</h4>
                    <div class="table-container-7">
                        <table border="1">
                            <tr class="table-header">
                                <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                                <th>Инструмент</th>
                                <th>Вид, форма выпуска ценной бумаги</th>
                                <th>Тип ценной бумаги</th>
                                <th>Эмитент</th>
                                <th>Код гос.регистрации</th>
                                <!--<th>Тип CB/Форма/Выпуск</th>-->

                                <th>ISIN код</th>
                            </tr>

                            <!-- Цикл по сделкам -->
                            <xsl:for-each select="/REPORT_DOC/SecurityCodes/SecurityCodes">
                                <tr>
                                    <!-- Вывод значений атрибутов -->
                                    <td>
                                        <xsl:value-of select="@NameSec"/>
                                    </td>
                                    <!--<td><xsl:value-of select="@ShortNameType"/></td>-->
                                    <td>
                                        <xsl:value-of select="@TypeCBFormIssue"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@TypeSec"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@IssuerName"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@StateRegistrationCode"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@ISIN"/>
                                    </td>

                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                </xsl:if>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
