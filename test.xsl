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
					
                    .table-container {  /* Контейнер для таблиц */
                        border: 2px solid #E6E6FA; /* Рамка контейнера */
                        border-radius: 10px;
                        padding: 5px;
                        margin-bottom: 20px;
						width: 95%;
						background-color: #DAA520;
						box-shadow: 0 4px 15px rgba(218, 165, 32, 0.5);
                    }
                    table {
                        border-collapse: collapse;
                        width: 100%;
                        box-sizing: border-box;
						border: none;  /* Убираем границы у таблицы */
						background-color: white;
                    }
                    th, td {  padding: 8px; }
                    .container {width: 87%;  margin: 0 auto;}
                   
					.marketplace-header {
						background-color: #DAA520;
						padding: 10px;
						display: flex;
						justify-content: space-between;
						align-items: center;
                        box-sizing: border-box;
                        height: 100%;
						font-size: 14px;
					}
					
					.marketplace-footer {
						font-size: 14px;
						background-color: #e6e6e6;
						padding: 10px;
						display: flex;
						justify-content: space-between;
						align-items: center;
                        box-sizing: border-box;
                        height: 100%;
					}
					
					.marketplace-orange {
						font-size: 14px;
						background-color: #DAA520;
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
                <h5 style="text-align: center;">По сделкам и операциям за период: <xsl:value-of select="/REPORT_DOC/Report/@PeriodBegin"/> - <xsl:value-of select="/REPORT_DOC/Report/@PeriodEnd"/></h5>
                <h5 style="text-align: right; margin: 0;">Дата составления отчета: <xsl:value-of select="/REPORT_DOC/Report/@ReportDate"/></h5>
                <h5 style="text-align: right; margin: 0;">Клиент:  <xsl:value-of select="/REPORT_DOC/Report/@ClientName"/></h5>
                <h5 style="text-align: right; margin: 0;"><xsl:value-of select="/REPORT_DOC/Report/@AgreementBasis"/></h5>
				</div>

				  <h4>1.3. Сделки РЕПО:</h4>

				  <div class="table-container">  <!-- Общий контейнер -->
				<table border="1" style=" margin-bottom: 30px;  width: 95%;  margin: 0 auto;">
                    <tr class="table-header">
                        <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                        <th>Дата заключения сделки</th>
                        <th>Время заключения сделки</th>
                        <th>Дата исполнения обязательств</th>
                        <th>Номер биржевой сделки</th>
                        <th>Код расчетов</th>
                        <th>Срок расчетов, дн.</th>
                        <th>Вид сделки (покупка, продажа, иной вид)</th>
                        <th>Инструмент</th>
                        <th>Цена одной ЦБ</th>
                        <th>Валюта цены</th>
                        <th>Количество ЦБ, шт.</th>
                        <th>Сумма Сделки</th>
                        <th>Валюта платежа</th>
                        <th>Сумма НКД</th>
                        <th>Место заключения сделки</th>
                        <th>Комиссия биржи</th>
                        <th>Комиссия брокера</th>
                        <th>в т.ч. НДС</th>
                    </tr>
					<tr>
						<td colspan="18" style="padding: 0; border-left: none; border-right: none;"><h4  class="marketplace-header">Исполненные сделки:</h4></td>
					</tr>
                    <!-- Цикл по сделкам со статусом "1" -->
                    <xsl:variable name="executedDeals" select="/REPORT_DOC/REPODeals/REPODeal[@Status='1']"/>
                    <xsl:for-each select="$executedDeals">
                        <tr>
                            <!-- Вывод значений атрибутов -->
                            <!-- Форматирование даты транзакции -->
							<td><xsl:call-template name="format-date">
								<xsl:with-param name="date" select="@Dateoftransaction"/>
							</xsl:call-template></td>
                            <td><xsl:value-of select="@Timeoftransaction"/></td>
							<td><xsl:call-template name="format-date">
								<xsl:with-param name="date" select="@DateOfFulfillmentOfObligations"/>
							</xsl:call-template></td>
                            <td><xsl:value-of select="@Exchangetradenumber"/></td>
                            <td><xsl:value-of select="@CalculationCode"/></td>
                            <td><xsl:value-of select="@CalculationPeriod"/></td>
                            <td><xsl:value-of select="@Transactiontype"/></td>
                            <td><xsl:value-of select="@Asset"/></td>
                            <td>
								<xsl:value-of select="format-number(@Cost, '#,##0.000000')"/>
							</td>
                            <td><xsl:value-of select="@CurrencyPrices"/></td>
                            <td>
								<xsl:value-of select="round(@Quantity)"/>
							</td>

                            <td><xsl:value-of select="@AmountCurrencyPayment"/></td>
                            <td><xsl:value-of select="@PaymentCurrency"/></td>
                            <td><xsl:value-of select="@AmountNCDCurrencyPayment"/></td>
                            <td><xsl:value-of select="@PlaceDeals"/></td>
                            <td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@ExchangeCommission = '0.00' or @ExchangeCommission = 0">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@ExchangeCommission"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@BrokerCommission = '0.00' or @BrokerCommission = 0">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@BrokerCommission"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
                            <td><xsl:value-of select="@NDS"/></td>
                        </tr>
                    </xsl:for-each>
					<tr   class="marketplace-footer">
						<td colspan="9" style="text-align: left;">Количество сделок:</td>
						<td colspan="9" style="text-align: right;"><xsl:value-of select="count($executedDeals)"/></td>
					</tr>
					<tr>
						<td colspan="18" style="padding: 0; border-left: none; border-right: none;"><h4  class="marketplace-header">Незавершенные сделки к исполнению:</h4></td>
					</tr>
                    <!-- Цикл по сделкам со статусом "2" -->
                    <xsl:variable name="pendingDeals" select="/REPORT_DOC/REPODeals/REPODeal[@Status='2']"/>
                    <xsl:for-each select="$pendingDeals">
                        <tr>
                            <!-- Вывод значений атрибутов -->
                            <!-- Форматирование даты транзакции -->
							<td><xsl:call-template name="format-date">
								<xsl:with-param name="date" select="@Dateoftransaction"/>
							</xsl:call-template></td>
                            <td><xsl:value-of select="@Timeoftransaction"/></td>
							<td><xsl:call-template name="format-date">
								<xsl:with-param name="date" select="@DateOfFulfillmentOfObligations"/>
							</xsl:call-template></td>
                            <td><xsl:value-of select="@Exchangetradenumber"/></td>
                            <td><xsl:value-of select="@CalculationCode"/></td>
                            <td><xsl:value-of select="@CalculationPeriod"/></td>
                            <td><xsl:value-of select="@Transactiontype"/></td>
                            <td><xsl:value-of select="@Asset"/></td>
                            <td>
								<xsl:value-of select="format-number(@Cost, '#,##0.000000')"/>
							</td>
                            <td><xsl:value-of select="@CurrencyPrices"/></td>
                            <td>
								<xsl:value-of select="round(@Quantity)"/>
							</td>

                            <td><xsl:value-of select="@AmountCurrencyPayment"/></td>
                            <td><xsl:value-of select="@PaymentCurrency"/></td>
                            <td><xsl:value-of select="@AmountNCDCurrencyPayment"/></td>
                            <td><xsl:value-of select="@PlaceDeals"/></td>
                            <td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@ExchangeCommission = '0.00' or @ExchangeCommission = 0">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@ExchangeCommission"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@BrokerCommission = '0.00' or @BrokerCommission = 0">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@BrokerCommission"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
                            <td><xsl:value-of select="@NDS"/></td>
                        </tr>
                    </xsl:for-each>
					<tr  class="marketplace-footer">
						<td colspan="9" style="text-align: left;">Количество сделок:</td>
						<td colspan="9" style="text-align: right;"><xsl:value-of select="count($pendingDeals)"/></td>
					</tr>
                </table>
				</div> <!-- Закрываем общий контейнер -->

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
