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
                    <xsl:value-of select="substring($date, 6, 2)"/>.<!-- Месяц -->
                    <xsl:value-of select="substring($date, 9, 2)"/>.<!-- День -->
                    <xsl:value-of select="substring($date, 1, 4)"/><!-- Год -->
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
                    table { border-collapse: collapse;}
                    th, td { border: 1px solid #ddd; padding: 8px; }
					.container {width: 87%;  margin: 0 auto;}
					h4 {margin-left: 3%;}
                </style>
            </head>
            <body>
				<div class="container">
				<div style="text-align: center; margin-top: 40px;">
				<img src="https://grottbjorn.com/upload/files/WuBlF0_C0/logo31052024.png" alt="Логотип" style="width:800px;"/>
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

                    <!-- Цикл по сделкам -->
                    <xsl:for-each select="/REPORT_DOC/REPODeals/REPODeal">
                        <tr>
                            <!-- Вывод значений атрибутов -->
                            <!-- Форматирование даты транзакции -->
							<td><xsl:call-template name="format-date">
								<xsl:with-param name="date" select="@Dateoftransaction"/> 
							</xsl:call-template></td>
                            <td><xsl:value-of select="@Timeoftransaction"/></td>
                            <td><xsl:value-of select="@DateOfFulfillmentOfObligations"/></td>
                            <td><xsl:value-of select="@Exchangetradenumber"/></td>
                            <td><xsl:value-of select="@CalculationCode"/></td>
                            <td><xsl:value-of select="@CalculationPeriod"/></td>
                            <td><xsl:value-of select="@Transactiontype"/></td>
                            <td><xsl:value-of select="@Asset"/></td>
                            <td><xsl:value-of select="@Cost"/></td>
                            <td><xsl:value-of select="@CurrencyPrices"/></td>
                            <td><xsl:value-of select="@Quantity"/></td>
                            <td><xsl:value-of select="@AmountCurrencyPayment"/></td>
                            <td><xsl:value-of select="@PaymentCurrency"/></td>
                            <td><xsl:value-of select="@AmountNCDCurrencyPayment"/></td>
                            <td><xsl:value-of select="@PlaceDeals"/></td>
                            <td><xsl:value-of select="@ExchangeCommission"/></td>
							<td><xsl:value-of select="@BrokerCommission"/></td>
                            <td><xsl:value-of select="@NDS"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
				
				<h4>3.2. Информация о состоянии портфеля ценных бумаг:</h4>
				
				<table border="1" style=" margin-bottom: 30px;  width: 80%;  margin-left: 2.5%;">
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
                            <td><xsl:value-of select="@RemainderStart"/></td>
                            <td><xsl:value-of select="@Enrolled"/></td>
                            <td><xsl:value-of select="@Writtenoff"/></td>
                            <td><xsl:value-of select="@RemainderEnd"/></td>
                            <td><xsl:value-of select="@MarketPrice"/></td>
                            <td><xsl:value-of select="@PlannedRef"/></td>
                            <td><xsl:value-of select="@PaymentCurrency"/></td>
                            
                        </tr>
                    </xsl:for-each>
                </table>
				
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
                            <td><xsl:value-of select="@Requirements"/></td>
                            <td><xsl:value-of select="@Liabilities"/></td>
                            <td><xsl:value-of select="@Total"/></td>
                            
                            
                        </tr>
                    </xsl:for-each>
                </table>
				
				<h4>5.4. Информация о движении денежных средств:</h4>
				
				<table border="1" style=" margin-bottom: 30px;  width: 80%;  margin-left: 2.5%;">
                    <tr class="table-header">
                        <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                        <th>Дата совершения операции</th>
                        <th>Название операции</th>
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
				
				<table border="1" style="margin-bottom: 30px;  width: 60%;  margin-left: 2.5%;">
                    <tr class="table-header">
                        <!-- Заголовки таблицы на основе атрибутов REPODeal -->
                        <th>Дата</th>
                        <th>Торговая площадка</th>
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

                    <!-- Цикл по сделкам -->
                    <xsl:for-each select="/REPORT_DOC/CashBalances/CashMarkets/CashMarkets">
                        <tr>
                            <!-- Вывод значений атрибутов -->
							<td><xsl:call-template name="format-date">
								<xsl:with-param name="date" select="@Date"/> 
							</xsl:call-template></td>
                            <td><xsl:value-of select="@Marketplace"/></td>
                            <td><xsl:value-of select="@Currency"/></td>
                            <td><xsl:value-of select="@RemainderStart"/></td>
                            <td><xsl:value-of select="@DebtStart"/></td>
                            <td><xsl:value-of select="@MarginStart"/></td>
                            <td><xsl:value-of select="@FreeBalanceStart"/></td>
                            <td><xsl:value-of select="@Enrolled"/></td>
                            <td><xsl:value-of select="@Writtenoff"/></td>
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
