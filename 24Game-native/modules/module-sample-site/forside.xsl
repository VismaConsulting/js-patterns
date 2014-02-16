<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:stk="http://www.enonic.com/cms/xslt/stk">
    
    <xsl:template match="/">
        <h1>24 <span>Game</span></h1>

        <div class="gameButtons">
            <a href="#" id="howtoplayBtn">HOW TO PLAY</a>
            <a href="#" id="newgameBtn">NEW GAME</a>
            <a href="#" id="submitBtn">SUBMIT</a>
        </div>

        <div id="howToPlay" style="display: none;">
            <h3>How To Play This Awesome Game</h3>
            <p>
                Alle tallene må brukes, men hvert tall kan kun brukes en gang. Bruk så mange operatorer du vil. Tall og operatorer må dras inn i svarfeltet. Trykk på et tall eller operator i svarfeltet for å fjerne det. Resultatet må bli 24. Pow.
            </p>
        </div>

        <div id="info" style="display: none;">
            <xsl:comment>
                test
            </xsl:comment>
        </div>

        <div id="gameDiv">
            
            <button id="checkAnswer" style="display: none;">SEND INN SVAR</button>
        
            <div style="margin-top: 20px;">

                <div>
                    <div id="answerbox">
                        <xsl:comment>
                            test
                        </xsl:comment>
                    </div>

                </div>

                <div id="cards" style="margin-top: 30px;">                    
                    <xsl:comment>
                            test
                    </xsl:comment>
                </div>

                <div id="operators" style="margin-top: 30px;">
                    <div class="cardSmBtn lightgrey">
                        <span class="plus">+</span>
                    </div>
                    <div class="cardSmBtn lightgrey">
                        <span class="minus">-</span>
                    </div>
                    <div class="cardSmBtn lightgrey">
                        <span class="multiply">*</span>
                    </div>
                    <div class="cardSmBtn lightgrey">
                        <span class="divide">/</span>
                    </div>
                    <div class="cardSmBtn darkgrey">
                        <span class="pleft">(</span>
                    </div>
                    <div class="cardSmBtn darkgrey">
                        <span class="pright">)</span>
                    </div>
                </div>
            </div>
        </div>


        <div id="submitAnswerDiv">
            <h1>Gratulerer, du klarte det!</h1>
            <h2>Registrer deg og vær med i trekningen av noe awesome</h2>
            <form action="{portal:createServicesUrl( 'content', 'create', () )}" id="form" method="post">
                <p id="showTimeUsed">
                    <xsl:comment>test</xsl:comment>
                </p>
                <input type="hidden" name="categorykey" value="31"><xsl:comment>test</xsl:comment></input>
                <input type="hidden" name="timeused" id="timeused"><xsl:comment>test</xsl:comment></input>
                <label for="name">Name</label><br/>
                <input class="required" type="text" name="name" id="name"><xsl:comment>test</xsl:comment></input>
                <br/>
                <label for="phone">Mobil</label><br/>
                <input class="required digits" type="text" name="mobil" id="phone"><xsl:comment>test</xsl:comment></input>
                <br/>
                <label for="email">Epost</label><br/>
                <input class="required email" type="text" name="email" id="email"><xsl:comment>test</xsl:comment></input>
                <br/>
                <button id="submitAnswer">Send inn</button>
            </form>
        </div>

        <script>
        $(document).ready(function () {
            visma.app.init();
            visma.app.startGame();
            $("#form").validate();
        });
        </script>
    </xsl:template>
    
</xsl:stylesheet>