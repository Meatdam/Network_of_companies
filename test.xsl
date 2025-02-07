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
                    <xsl:value-of select="substring($date, 9, 2)"/>.<xsl:value-of select="substring($date, 6, 2)"/>.<xsl:value-of select="substring($date, 1, 4)"/>
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
                       
						width: 94%;
						background-color: #DAA520;
						
                    }
					
					.table-container-2 {  /* Контейнер для таблиц */
                        border: 2px solid #E6E6FA; /* Рамка контейнера */
                        border-radius: 10px;
                        padding: 5px;
                        
						width: 95%;
						background-color: #DAA520;
						
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
                <!--<h2>Дата документа: <xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_DATE"/></h2>
                <h2>Время документа: <xsl:value-of select="/REPORT_DOC/DOC_REQUISITES/@DOC_TIME"/></h2>-->
				<h5 style="text-align: center;">По сделкам и операциям за период: <xsl:value-of select="/REPORT_DOC/Report/@PeriodBegin"/> - <xsl:value-of select="/REPORT_DOC/Report/@PeriodEnd"/></h5>
                <h5 style="text-align: right; margin: 0;">Дата составления отчета: <xsl:value-of select="/REPORT_DOC/Report/@ReportDate"/></h5>
                <!--<p>Начальная дата: <xsl:value-of select="/REPORT_DOC/Report/@PeriodBegin"/></p>
                <p>Конечная дата: <xsl:value-of select="/REPORT_DOC/Report/@PeriodEnd"/></p>-->
                <h5 style="text-align: right; margin: 0;">Клиент:  <xsl:value-of select="/REPORT_DOC/Report/@ClientName"/></h5>
                <h5 style="text-align: right; margin: 0;"><xsl:value-of select="/REPORT_DOC/Report/@AgreementBasis"/></h5>
				</div>
				
                <h4>1.3. Сделки РЕПО:</h4>

				  <div class="table-container">  <!-- Общий контейнер -->
				<table border="1" style="  width: 95%; ">
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
						<td colspan="18" style="padding: 0; border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">Исполненные сделки:</td>
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
						<td colspan="18" style="padding: 0; border-left: 2px solid #DAA520; border-right: 2px solid #DAA520;">Незавершенные сделки к исполнению:</td>
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
				
				<h4>3.2. Информация о состоянии портфеля ценных бумаг:</h4>
				<div class="table-container-2">
				<table border="1" style=" width: 90%; ">
                    <tr class="table-header">
                        <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                        <th>Инструмент</th>
                        <th>Место учета ЦБ</th>
                        <th>Всего</th>
                        <th>Зачислено</th>
                        <th>Списано</th>
                        <th>Всего</th>
                        <th>Рыночная цена</th>
                        <th>Плановый исходящий остаток с учетом обязательств, шт.</th>
                        <th>Валюта платежа</th>
                    </tr>

                    <!-- Цикл по сделкам -->
                    <xsl:for-each select="/REPORT_DOC/StateSecuritiesPortfolio/StateSecuritiesPortfolio">
                        <tr>
                            <!-- Вывод значений атрибутов -->
                            <td><xsl:value-of select="@Asset"/></td>
                            <td><xsl:value-of select="@PlaceRegistration"/></td>
                            <td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@RemainderStart = '0,00'">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@RemainderStart"/>
								</xsl:otherwise>
							</xsl:choose>
							</td>
							<td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@Enrolled = '0,00'">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@Enrolled"/>
								</xsl:otherwise>
							</xsl:choose>
							</td>
							<td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@Writtenoff = '0,00'">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@Writtenoff"/>
								</xsl:otherwise>
							</xsl:choose>
							</td>
							<td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@RemainderEnd = '0,00'">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@RemainderEnd"/>
								</xsl:otherwise>
							</xsl:choose>
							</td>
							<td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@MarketPrice = ''">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="format-number(@MarketPrice, '##0.0000')"/>
								</xsl:otherwise>
							</xsl:choose>
							</td>
							<td style="mso-number-format:\@;">
							<xsl:choose>
								<xsl:when test="@PlannedRef = '0,00'">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@PlannedRef"/>
								</xsl:otherwise>
							</xsl:choose>
							</td>
                            <td><xsl:value-of select="@PaymentCurrency"/></td>
                            
                        </tr>
                    </xsl:for-each>
                </table>
				</div>
				
				<h4>3.5. Информация по обязательствам фондового рынка:</h4>
				
				<table border="1" style=" margin-bottom: 30px;  width: 50%;  margin-left: 2.5%;">
                    <tr class="table-header">
                        <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                        <th>Дата Исполнения</th>
                        <th>Валюта</th>
                        <th>Инструмент</th>
                        <th>Требования</th>
                        <th>Обязательство</th>
                        <th>Итого</th>
                        
                    </tr>

                    <!-- Цикл по сделкам -->	
                    <xsl:for-each select="/REPORT_DOC/StockMarketObligations/StockMarketObligation">
                        <tr>
                            <!-- Вывод значений атрибутов -->
							<td><xsl:call-template name="format-date">
								<xsl:with-param name="date" select="@ExecutionDate"/> 
							</xsl:call-template></td>
                            <td><xsl:value-of select="@Currency"/></td>
                            <td><xsl:value-of select="@Asset"/></td>
                            <td>
								<xsl:value-of select="format-number(@Requirements, '##0.00')"/>
							</td>
							<td>
								<xsl:value-of select="format-number(@Liabilities, '##0.00')"/>
							</td>
							<td>
								<xsl:value-of select="format-number(@Total, '##0.00')"/>
							</td>
                           
                            
                            
                        </tr>
                    </xsl:for-each>
                </table>
				
				<h4>5.4. Информация о движении денежных средств:</h4>
				
				<table border="1" style=" margin-bottom: 30px;  width: 80%;  margin-left: 2.5%;">
                    <tr class="table-header">
                        <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                        <th>Дата совершения операции</th>
                        <th>Наименование операции</th>
                        <th>Валюта операции</th>
                        <th>Приход</th>
                        <th>Расход</th>
                    </tr>

                    <!-- Цикл по сделкам -->
                    <xsl:for-each select="/REPORT_DOC/CashFlow/CashFlow">
                        <tr>
                            <!-- Вывод значений атрибутов -->
							<td><xsl:call-template name="format-date">
								<xsl:with-param name="date" select="@Date"/> 
							</xsl:call-template></td>
                            <td><xsl:value-of select="@NameOperation"/></td>
                            <td><xsl:value-of select="@Currency"/></td>
                            <td><xsl:value-of select="@Receipt"/></td>
                            <td><xsl:value-of select="@Expense"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
				
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
			<tr>
                <td colspan="16" style="padding: 0;">
                    <div class="marketplace-footer">
                        <div style="float: left;">
                          <b>В разрезе площадок:</b>
                        </div>
                    </div>
                </td>
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
                        <td colspan="16" style="padding: 0;">
                            <div class="marketplace-orange">
                                <div style="float: left;">
                                   <xsl:value-of select="$currentMarketplace"/>
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
					<tr>
                        <td colspan="16" style="padding: 0;">
                            <div class="marketplace-header">
                                <div style="float: left;">
                                   <b>Итого по площадке:</b>
                                </div>
                                <div style="float: right; margin-right: 150px;">
								<xsl:choose>
								<xsl:when test="$currentTotalSum = '0.00' or $currentTotalSum = 0">
									<xsl:value-of select="''"/>
								</xsl:when>
								<xsl:otherwise>
									<b><xsl:value-of select="$currentTotalSum"/></b>
								</xsl:otherwise>
							</xsl:choose>
                                   
                                </div>
                            </div>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>

			  <tr>
                <td colspan="16" style="padding: 0;">
					<div class="marketplace-footer">
						<b>В разрезе валют:</b>
					</div>
				</td>
            </tr>

				<xsl:for-each select="//CashMarkets[not(@Currency = preceding-sibling::CashMarkets/@Currency)]">
					<xsl:variable name="currentCurrency" select="@Currency"/>
					<xsl:variable name="cashMarketsForGroup" select="//CashMarkets[@Currency=$currentCurrency]"/>

					<xsl:variable name="totalRemainderStart" select="sum($cashMarketsForGroup/@RemainderStart)"/>
					<xsl:variable name="totalDebtStart" select="sum($cashMarketsForGroup/@DebtStart)"/>
					<xsl:variable name="totalMarginStart" select="sum($cashMarketsForGroup/@MarginStart)"/>
					<xsl:variable name="totalFreeBalanceStart" select="sum($cashMarketsForGroup/@FreeBalanceStart)"/>
					<xsl:variable name="totalEnrolled" select="sum($cashMarketsForGroup/@Enrolled)"/>
					<xsl:variable name="totalWrittenoff" select="sum($cashMarketsForGroup/@Writtenoff)"/>
					<xsl:variable name="totalTotal" select="sum($cashMarketsForGroup/@Total)"/>
					<xsl:variable name="totalDebtEnd" select="sum($cashMarketsForGroup/@DebtEnd)"/>
					<xsl:variable name="totalMarginEND" select="sum($cashMarketsForGroup/@MarginEND)"/>
					<xsl:variable name="totalAmountFree" select="sum($cashMarketsForGroup/@AmountFree)"/>
					<xsl:variable name="totalAmountDeposited" select="sum($cashMarketsForGroup/@AmountDeposited)"/>

					<!-- Средний курс (если нужно) -->
					<xsl:variable name="avgQuotation">
						<xsl:choose>
							<xsl:when test="count($cashMarketsForGroup) > 0">
								<xsl:value-of select="sum($cashMarketsForGroup/@Quotation) div count($cashMarketsForGroup)"/>
							</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>

					<xsl:variable name="totalCostRUR" select="sum($cashMarketsForGroup/@CostRUR)"/>
					<xsl:variable name="totalPlannedClosing" select="sum($cashMarketsForGroup/@PlannedClosing)"/>
					 <xsl:if test="$cashMarketsForGroup">
					<tr>
						<td>
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="$cashMarketsForGroup[1]/@Date"/>
							</xsl:call-template>
						</td>
						<td><xsl:value-of select="$currentCurrency"/></td>
						<td><xsl:value-of select="format-number($totalRemainderStart, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalDebtStart, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalMarginStart, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalFreeBalanceStart, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalEnrolled, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalWrittenoff, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalTotal, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalDebtEnd, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalMarginEND, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalAmountFree, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalAmountDeposited, '##0.00')"/></td>
						<td><xsl:value-of select="$avgQuotation"/></td>
						<td><xsl:value-of select="format-number($totalCostRUR, '##0.00')"/></td>
						<td><xsl:value-of select="format-number($totalPlannedClosing, '##0.00')"/></td>
					</tr>
					</xsl:if>
				</xsl:for-each>
        </table>
				
				
				<h4>6.1. Расшифровка комиссий:</h4>
				<table border="1" style="margin-bottom: 30px;  width: 40%;  margin-left: 2.5%;">
                    <tr class="table-header">
                        <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                        <th>Вид комисии</th>
                        <th>Сумма, руб.</th>
                    </tr>

                    <!-- Цикл по сделкам -->
                    <xsl:for-each select="/REPORT_DOC/Commissions/CommissionType">
                        <tr>
                            <!-- Вывод значений атрибутов -->
                            <td><xsl:value-of select="@CommissionType"/></td>
                            <td><xsl:value-of select="@CommissionSum"/></td>
                            
                        </tr>
                    </xsl:for-each>
                </table>
				
				<h4>7.1. Расшифровка кодов ценных бумаг:</h4>
				<table border="1" style="margin-bottom: 30px;  width: 80%;  margin-left: 2.5%;">
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
                            <td><xsl:value-of select="@NameSec"/></td>
                            <!--<td><xsl:value-of select="@ShortNameType"/></td>-->
							 <td><xsl:value-of select="@TypeCBFormIssue"/></td>
							 <td><xsl:value-of select="@TypeSec"/></td>
                            <td><xsl:value-of select="@IssuerName"/></td>
                            <td><xsl:value-of select="@StateRegistrationCode"/></td>
                            <td><xsl:value-of select="@ISIN"/></td>
                            
                        </tr>
                    </xsl:for-each>
                </table>
				
            </body>
        </html>
    </xsl:template>
				
</xsl:stylesheet>
