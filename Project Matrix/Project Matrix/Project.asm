Include Irvine32.inc
.data
start1 byte "Please Enter 1 for Multiplication 2 for addition, 3 for subtraction, 4 for exit : ",0
errorr byte "You have entered wrong digit please write again",0
test1 byte "working correctly",0
height1 byte "Write height of array : ",0
weidth1 byte "Write weidth of array : ",0
height2 byte "Write height of 2nd array : ",0
weidth2 byte "Write weidth of 2nd array : ",0
result byte "Result",0
sizeerror byte "You have entered wrong size please provide correct one",0
array1_msg byte "Enter valuse of Matrix 1 index ",0
array2_msg byte "Enter valuse of Matrix 2 index ",0
counter dword 0
array1 dword 30 dup(0)
array2 dword 30 dup(0)
array3 dword 30 dup(0)
ans dword 0
ans2 dword 0
height dword 0
weidth dword 0
weidth3 dword 0
height3 dword 0
.code
main PROC
start:
mov edx, offset start1
call writestring
call readint
cmp eax, 1
jz multi
cmp eax, 2
jz addi
cmp eax, 3
jz subtr
cmp eax, 4
jz exit1
jg errorrr


multi:
mov edx,offset  height1
call writestring
call readint
call crlf
mov height, eax
mov edx,offset  weidth1
call writestring
call readint
call crlf
mov weidth, eax
mul height
mov ans, eax
mov edx,offset  height2
call writestring
call readint
call crlf
mov ebx, eax
mov height, eax
mov edx,offset  weidth2
call writestring
call readint
call crlf
mov weidth3, eax
mul ebx
mov ebx, weidth3
mov ans2, eax
cmp ebx, height
jz multiplication
mov edx,offset sizeerror
call writestring
call crlf
jmp multi

multiplication:
;mul ebx
;mov ans2, eax
mov ecx, 0
mov esi, offset array1
.while (ecx < ans)
mov edx, offset array1_msg
call writestring
mov eax, ecx
call writedec
call crlf
call readint
mov [esi], eax
add esi, 4
inc ecx
.endw

mov ecx, 0
mov esi, offset array2
.while (ecx < ans2)
mov edx, offset array2_msg
call writestring
mov eax, ecx
call writedec
call crlf
call readint
add [esi], eax
add esi, 4
inc ecx
.endw
mov edx, offset result
call writestring
call crlf

mov counter, 4
mov esi, offset array3
mov edx, 0
mov edi, offset array1
mov ebx, 1
.while (ebx <= ans)
mov ecx, 0
.while(ecx < weidth)
mov eax, [edi]
mul array2[edx]
add [esi], eax
add edi, 4
mov eax, 4
mul weidth3
add edx, eax
inc ecx
.endw
mov eax, ebx
mul counter
inc ebx
mov edx, eax 
add esi, 4
.endw
 
mov ecx, 0
mov esi, offset array3
;put ans instead of 30
.while (ecx < ans)
mov eax, [esi]
call writeint
call crlf
add esi, 4
inc ecx
.endw
mov counter, 0
jmp start



addi:
mov edx,offset  height1
call writestring
call readint
call crlf
mov height, eax
mov edx,offset  weidth1
call writestring
call readint
call crlf
mov weidth, eax
mul height
mov ans, eax
cmp ans, 0
jnz addition
mov edx,offset sizeerror
call writestring
call crlf
jmp addi

addition:
mov edx, offset array1_msg
call writestring
call crlf
mov ecx, 0
mov esi, offset array1
.while (ecx < ans)
call readint
mov [esi], eax
add esi, 4
inc ecx
.endw
mov edx, offset array2_msg
call writestring
call crlf
mov ecx, 0
mov esi, offset array1
.while (ecx < ans)
call readint
add [esi], eax
add esi, 4
inc ecx
.endw
mov edx, offset result
call writestring
call crlf
mov ecx, 0
mov esi, offset array1
.while (ecx < ans)
mov eax, [esi]
call writeint
call crlf
add esi, 4
inc ecx
.endw
jmp start

subtr:
mov edx,offset  height1
call writestring
call readint
call crlf
mov height, eax
mov edx,offset  weidth1
call writestring
call readint
call crlf
mov weidth, eax
mul height
mov ans, eax
cmp ans, 0
jnz subtraction
mov edx,offset sizeerror
call writestring
call crlf
jmp subtr

subtraction:
mov edx, offset array1_msg
call writestring
call crlf
mov ecx, 0
mov esi, offset array1
.while (ecx < ans)
call readint
mov [esi], eax
add esi, 4
inc ecx
.endw
mov edx, offset array2_msg
call writestring
call crlf
mov ecx, 0
mov esi, offset array1
.while (ecx < ans)
call readint
sub [esi], eax
add esi, 4
inc ecx
.endw
mov edx, offset result
call writestring
call crlf
mov ecx, 0
mov esi, offset array1
.while (ecx < ans)
mov eax, [esi]
call writeint
call crlf
add esi, 4
inc ecx
.endw
jmp start

errorrr:
mov edx,offset  errorr
call writestring
call crlf
jmp start

call crlf
call waitmsg
exit1:
exit
main endp
end main