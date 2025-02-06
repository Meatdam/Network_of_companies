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
                    <xsl:value-of select="substring($date, 9, 2)"/>.<xsl:value-of select="substring($date, 6, 2)"/>.<xsl:value-of select="substring($date, 6, 2)"/>.<xsl:value-of select="substring($date, 1, 4)"/>
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
                <title><xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_NAME"/></title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    .section-header { background-color: #fae6a5; padding: 10px; }
                    .table-header { background-color: #e6e6e6; }
                    table {
                        border-collapse: collapse;
                        width: 95%; /* Ширина таблицы */
                        margin-left: 2.5%; /* Отступ таблицы */
                        box-sizing: border-box; /* Включаем границы и отступы в ширину */
                    }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left;}
                    .container {width: 87%;  margin: 0 auto;}
                    h4 {margin-left: 3%;}
					.marketplace-header {
						background-color: #d4edda; /* Светло-зеленый цвет для заголовка */
						padding: 10px;
						display: flex;
						justify-content: space-between;
						align-items: center;
                        /*width: 100%;  Ширина заголовка */
                       /* margin-left: 2.5%;  Отступ заголовка */
                        box-sizing: border-box; /* Включаем границы и отступы в ширину */
                        height: 100%; /* Заполнение высоты ячейки */
					}
					td {
						position: relative; /* Для позиционирования .marketplace-header */
					}
                </style>
            </head>
            <body>

			<div class="text" style="color: #666666; float: right; margin-top: 20px; margin-bottom: 20px; margin-right: 120px;">
				<a href="https://grottbjorn.com/" style="color: #666666; text-decoration: none;"><p>Акционерное общество Финансовое ателье ГроттБьерн</p></a>
				<p>Лицензия: № 166-02672-100000 от 01.11.2000 г.</p>
			</div>
				<div class="container" style="clear: both;">


				<div class="text_2" style="color: #666666; clear: both;">
				<a href="https://grottbjorn.com/" style="color: #666666; text-decoration: none;"><img src="https://raw.githubusercontent.com/grottbjorn/styles-and-logos/refs/heads/main/test.png" alt="Логотип"/></a>
				</div>

				<h3 style="text-align: center;"><xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_NAME"/></h3>
                <!--<h2>Дата документа: <xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_DATE"/></h2>
                <h2>Время документа: <xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_TIME"/></h2>-->
				<h5 style="text-align: center;">По сделкам и операциям за период: <xsl:value-of select="/REPORT_DOC/Report/@PeriodBegin"/> - <xsl:value-of select="/REPORT_DOC/Report/@PeriodEnd"/></h5>
                <h5 style="text-align: right; margin: 0;">Дата составления отчета: <xsl:value-of select="/REPORT_DOC/Report/@ReportDate"/></h5>
                <!--<p>Начальная дата: <xsl:value-of select="/REPORT_DOC/Report/@PeriodBegin"/></p>
                <p>Конечная дата: <xsl:value-of select="/REPORT_DOC/Report/@PeriodEnd"/></p>-->
                <h5 style="text-align: right; margin: 0;">Клиент:  <xsl:value-of select="/REPORT_DOC/Report/@ClientName"/></h5>
                <h5 style="text-align: right; margin: 0;"><xsl:value-of select="/REPORT_DOC/Report/@AgreementBasis"/></h5>
				</div>

				<h4>5.5. Информация об остатках денежных средств:</h4>

        <!-- Создаем таблицу -->
        <table border="1" style="box-sizing: border-box;">
            <tr class="table-header">
                <!-- Заголовки таблицы  -->
                <th>Дата</th>
                <th>Валюта</th>
                <th>Остаток</th>
                <th>Задолжность перед Брокером</th>
                <th>Начальная маржа</th>
                <th>Сумма средств свободная от обязательств</th>
                <th>Приход</th>
                <th>Расход</th>
                <th>Остаток</th>
                <th>Задолжность перед брокером</th>
                <th>Начальная маржа</th>
                <th>Сумма средств свободная от обязательств</th>
                <th>Уведомление: Сумма к внесению</th>
                <th>Курс</th>
                <th>Остаток на конец по курсу</th>
                <th>Плановый исходящий остаток с учетом обязательств</th>
            </tr>

            <!-- Группировка по Marketplace -->
            <xsl:for-each select="//CashMarkets[not(@Marketplace = preceding-sibling::CashMarkets/@Marketplace)]">
                <xsl:variable name="currentMarketplace" select="@Marketplace"/>
                <xsl:variable name="dataForMarketplace" select="//CashMarkets[@Marketplace = $currentMarketplace]"/>

                <!-- Проверка на наличие данных для текущего Marketplace -->
                <xsl:if test="$dataForMarketplace">
                    <xsl:variable name="currentTotalSum" select="$dataForMarketplace[1]/@TotalSum"/>

                    <!-- Заголовок для каждого Marketplace -->
                    <tr>
                        <td colspan="16">
                            <div class="marketplace-header">
                                <div style="float: left;">
                                    <xsl:value-of select="$currentMarketplace"/>
                                </div>
                                <div style="float: right;">
                                    TotalSum: <xsl:value-of select="$currentTotalSum"/>
                                </div>
                            </div>
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
                            <td><xsl:value-of select="@Currency"/></td>
                            <td><xsl:value-of select="@RemainderStart"/></td>
                            <td><xsl:value-of select="@DebtStart"/></td>
                            <td><xsl:value-of select="@MarginStart"/></td>
                            <td><xsl:value-of select="@FreeBalanceStart"/></td>
                            <td>
                                <xsl:value-of select="format-number(@Enrolled, '##0.00')"/>
                            </td>
                            <td>
                                <xsl:value-of select="format-number(@Writtenoff, '##0.00')"/>
                            </td>
                            <td><xsl:value-of select="@Total"/></td>
                            <td><xsl:value-of select="@DebtEnd"/></td>
                            <td><xsl:value-of select="@MarginEND"/></td>
                            <td><xsl:value-of select="@AmountFree"/></td>
                            <td><xsl:value-of select="@AmountDeposited"/></td>
                            <td><xsl:value-of select="@Quotation"/></td>
                            <td><xsl:value-of select="@CostRUR"/></td>
                            <td><xsl:value-of select="@PlannedClosing"/></td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
