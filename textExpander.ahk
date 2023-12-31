;#SingleInstance force
#InputLevel, Unicode

;---------------------------------------General functions start-----------------------------------------------------
jumpToNextLine(){
    Send, {Shift down}{Enter}{Shift up}
}

pasteText(){
     Send, ^v
}

pressEnter(){
    Send, {Enter}
}

addDashesDelimiterJumpLine() {
    SendInput, -------------------------------------------------
    jumpToNextLine()
}

typeSentenceJumpLine(string) {
    SendInput, "%string%"
    jumpToNextLine()
}

pastePreviousCopiedText(){
    Sleep, 1000
    Send, #v
    Sleep, 1000
    Send, {Down}
    Sleep, 300
    Send, {Enter}
}

;---------------------------------------General functions end-----------------------------------------------------

;------------------------------------Window Operation start-----------------------------------------
#^1::switchToVirtualDesktopByNum(1)  ; When Win+Tab+1 is pressed
#^2::switchToVirtualDesktopByNum(2)  ; When Win+Tab+2 is pressed
#^3::switchToVirtualDesktopByNum(3)  ; When Win+Tab+3 is pressed
#^4::switchToVirtualDesktopByNum(4)  ; When Win+Tab+4 is pressed
#^5::switchToVirtualDesktopByNum(5)  ; When Win+Tab+5 is pressed
#^6::switchToVirtualDesktopByNum(6)  ; When Win+Tab+6 is pressed

switchToVirtualDesktopByNum(num) {
    Send, {LWin down}{Tab down}{LWin up}{Tab up}   ; Press Win+Tab
    Sleep, 600  ; Wait a bit for the animation or window to catch up
    Send, {Down 3}  ; Press Down arrow key three times
    Sleep, 50
    Send, {Home}  ; Press Home key once
    Sleep, 50
    Loop, % num - 1  ; Calculate how many times to press the Right arrow
    {
        Send, {Right}  ; Press Right arrow key
        Sleep, 50
    }
    Send, {Enter}  ; Press Enter key
    return
}

;------------------------------------Window Operation end-----------------------------------------


;---------------------------------Program operations start----------------------------------------------------
^!q::ExitApp ; ^ is Ctrl, ! is Alt

::gpt4gpt4::
    Send, ^l
    Sleep, 100
    SendInput, https://chat.openai.com/?model=gpt-4
    Sleep, 100
    pressEnter()
return
;---------------------------------Program operations end----------------------------------------------------

;---------------------------------------ChatGPT prompt start-----------------------------------------------------
::eli5::
    SendInput, Hey ChatGPT, explain below sentence or paragraph under '---' delimiter, like I am five years old
    jumpToNextLine()
    addDashesDelimiterJumpLine()
    pasteText()
    pressEnter()
return

::afun::
SendInput, Hey ChatGPT, write me a typescript function that I will put in Angular component, the input are
return

::dbc::
SendInput, Hey ChatGPT, the code under '---' delimiter may or may not have bug, probably miss some colons, brackets, correct it:
jumpToNextLine()
    addDashesDelimiterJumpLine()
pasteText()
pressEnter()
return

::icode::"ChatGPT, improve this code"

::ieng::
SendInput, "ChatGPT, improve the English under  '---' delimiter":
jumpToNextLine()
    addDashesDelimiterJumpLine()
pasteText()
pressEnter()
return

::sho::
SendInput, ChatGPT, shorten the code under '---' delimiter, while maintaining the formatting style where each argument to a function call is on its own line, and ternary operators are split across multiple lines for better readability?:
jumpToNextLine()
    addDashesDelimiterJumpLine()
pasteText()
pressEnter()
return

::exb::
SendInput, Hey ChatGPT, explain the article/word under '---' delimiter like I am beginner without background knowledge or knowing terminology:
    jumpToNextLine()
    addDashesDelimiterJumpLine()
    pasteText()
    pressEnter()
return

::exv::
SendInput, Hey ChatGPT, explain the following words inside [] in the context of article below '---' delimiter and its general meaning supplement with 3 examples. Please make the 'in the context of the article' and 'general meaning' sections stand out.
jumpToNextLine()
addDashesDelimiterJumpLine()
pasteText()
jumpToNextLine()
SendInput, []
Send, {Left}
return

::ext::
SendInput, Hey ChatGPT, explain the article/word under '---' delimiter and supplement with table or graph to explain  :
jumpToNextLine()
    addDashesDelimiterJumpLine()
pasteText()
pressEnter()
return

::ttc::
SendInput, Hey ChatGPT, translate below text under '---' delimiter to traditional Chinese  :
jumpToNextLine()
    addDashesDelimiterJumpLine()
return

::tsc::
SendInput, Hey ChatGPT, translate below text under '---' delimiter to simplified Chinese  :
jumpToNextLine()
    addDashesDelimiterJumpLine()
return

::ahkw::
SendInput, Hey ChatGPT, write me .ahk code, the example format is " return"  :
jumpToNextLine()
    SendInput, ----------------Things I want to do----------------------
    jumpToNextLine()
return

::imsg::
SendInput, Hey ChatGPT, the message is below, what should I do?
    SendInput, ----------------The message----------------------
    jumpToNextLine()
    pasteText()
    pressEnter()
return

::vvv::
SendInput, Hey ChatGPT, now I will send you bunch of articles. You should records the experts that give comments in the article, especially about the impact of the drug on food industry, if their comments are related, then also give me a true flag, and in formatting, put all true in the front of your answer
    SendInput, ----------------The message----------------------
    jumpToNextLine()
    pasteText()
    pressEnter()
return

::ddd::
jumpToNextLine()
return

::rei::
SendInput, "Hey GPT, in previous session, there was a specific response or behavior that was particularly helpful or desirable, which I want to reinforce. See the example provided wrapped by the '---' delimiter, then I will tell you what's correct below it"
    jumpToNextLine()
    addDashesDelimiterJumpLine()
    SendInput, Example:
    JumpToNextLine()
    pasteText()
    jumpToNextLine()
    addDashesDelimiterJumpLine()
    SendInput, "Hey GPT, what you are doing correct is below:"
    jumpToNextLine()
return

::cor::
SendInput, "Hey GPT, in previous session, there was a specific response or behavior that was unhelpful or undesirable, which I want to prevent it happen again. See the example provided wrapped the '---' delimiter for reference, then I will tell you what's wrong below it"
    jumpToNextLine()
    addDashesDelimiterJumpLine()
    SendInput, Example:
    jumpToNextLine()
    pasteText()
    jumpToNextLine()
    addDashesDelimiterJumpLine()
    SendInput, "Hey GPT, what you are doing wrong is below:"
    jumpToNextLine()



::ceng::
Clipboard = Hey ChatGPT, pretend you're English corrector that satisfy below requirements:`nMe, as the user, will send you some English writing. You need to correct the grammar, spelling, punctuations`nAVOID changing the wording unless absolutely necessary. If a change is needed, issue a warning before making the alteration. An example of unnecessary is changing from 'many people' to 'dense', as they have similar meaning`nAVOID any alterations for stylistic or contextual clarity`nAVOID making changes to formalize the language unless it corrects a grammatical error. Retain informal or conversational elements as they are`nYou should always try to keep the format of the writing unchanged when you output`nTo help you understand the correct ways to interact with the user, first, the user will input an English writing, then you point out the errors with explanation, with the categories Grammar, Punctuation, Spelling. NEVER repeat the same error in different category`nAfter that, output the revised version in normal text, but BOLDEN the change and you make. Also, when appropriate with a bracket, indicate the change you make by '(original wording or sentence => revised wording or sentence ) e.g. '(was => is) or (webcite => website)' for the user to convenient see the changes you make`nThen, output a code block that contains the revised version, WITHOUT the bolden and bracket above, just return the normal revised text`nNEVER add quotation marks and NEVER make a summary on how it is changed. If there is no error, then say 'There is no error'`n---`n
Sleep, 50  ; Wait for the clipboard to be ready
pasteText()
addDashesDelimiterJumpLine()
pastePreviousCopiedText()
pressEnter()
return

::shc::
typeSentenceJumpLine("你好ChatGPT, 幫我精簡中文, 我會在 '---' 輸入需要精簡的文章, 然後要你輸出精簡後的文章, 並遵從以下條件")
typeSentenceJumpLine("1. 千萬不要省略, 修改任何內容, 只需簡化表達方式, 例如將'因為'改成'因'，'並且'改成'並'，'令到'改成'令', '可以'改成'可'")
typeSentenceJumpLine("2. 請保留所有原文的內容和詞彙，包括未來時態的表示詞如'將'。")
typeSentenceJumpLine("3. 千萬不要轉換詞彙, 如果任何詞彙有明顯錯誤, 請告知")
typeSentenceJumpLine("4. 輸出千萬不要包含原文")
typeSentenceJumpLine("5. 輸出精簡後的文章, 千萬不要加一個解釋或者總結")
typeSentenceJumpLine("6. 請幫我修改標點符號")
addDashesDelimiterJumpLine()
pasteText()
pressEnter()

::testa::
pastePreviousCopiedText()

;---------------------------------------ChatGPT prompt end-----------------------------------------------------

