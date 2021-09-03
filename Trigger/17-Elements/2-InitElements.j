globals
    hashtable Elem = InitHashtable()
endglobals


function SetAbilityElement takes integer i, integer i2 returns nothing
call SaveBoolean(Elem,i,i2,true)
endfunction


function Trig_InitElements_Actions takes nothing returns nothing

//Fire 1
call SetAbilityElement('AHfs',1)
call SetAbilityElement('AHpx',1)
call SetAbilityElement('Aliq',1)
call SetAbilityElement('AEim',1)
call SetAbilityElement('AHfa',1)
call SetAbilityElement('AImp',1)
call SetAbilityElement('ANvc',1)
call SetAbilityElement('ANic',1)
call SetAbilityElement('ANrf',1)
call SetAbilityElement('ANbf',1)
call SetAbilityElement('ANlm',1)
call SetAbilityElement('ANso',1)
call SetAbilityElement('A02U',1)
call SetAbilityElement('A06Q',1)
call SetAbilityElement('A06M',1)
call SetAbilityElement('A04H',1)
call SetAbilityElement('Ainf',1)
call SetAbilityElement('A07B',1)
call SetAbilityElement('A052',1)
call SetAbilityElement('A050',1)
call SetAbilityElement('A06N',1)
call SetAbilityElement('AUin',1)
call SetAbilityElement('Afae',1)
call SetAbilityElement('H016',1)
call SetAbilityElement('A076',1)
call SetAbilityElement('O005',1)
call SetAbilityElement('O007',1)
call SetAbilityElement('A08V',1)
//Water 2
call SetAbilityElement('AHwe',2)
call SetAbilityElement('AHbz',2)
call SetAbilityElement('AUfn',2)
call SetAbilityElement('AUfu',2)
call SetAbilityElement('AHca',2)
call SetAbilityElement('A02Z',2)
call SetAbilityElement('A01Y',2)
call SetAbilityElement('A03J',2)
call SetAbilityElement('A053',2)
call SetAbilityElement('A03J',2)
call SetAbilityElement('Aclf',2)
call SetAbilityElement('AHab',2)
call SetAbilityElement('ANms',2)
call SetAbilityElement('ANto',2)
call SetAbilityElement('A046',2)
call SetAbilityElement('A07C',2)
call SetAbilityElement('AHab',2)
call SetAbilityElement('ANms',2)
call SetAbilityElement('A02X',2)
call SetAbilityElement('O006',2)
call SetAbilityElement('H018',2)
call SetAbilityElement('A08W',2)
call SetAbilityElement('H003',2)
call SetAbilityElement('H001',2)
call SetAbilityElement('A077',2)
call SetAbilityElement('ANmo',2)
call SetAbilityElement('A07X',2)
//Wind 3
call SetAbilityElement('AHtc',3)
call SetAbilityElement('AOcl',3)
call SetAbilityElement('ANmo',3)
call SetAbilityElement('ANfl',3)
call SetAbilityElement('ACls',3)
call SetAbilityElement('A02T',3)
call SetAbilityElement('A02S',3)
call SetAbilityElement('A02I',3)
call SetAbilityElement('A03B',3)
call SetAbilityElement('A075',3)
call SetAbilityElement('AOwk',3)
call SetAbilityElement('Aclf',3)
call SetAbilityElement('Ac7E',3)
call SetAbilityElement('A06C',3)
call SetAbilityElement('A05X',3)
call SetAbilityElement('AHtb',3)
call SetAbilityElement('AHtc',3)
call SetAbilityElement('AEev',3)
call SetAbilityElement('A03U',3)
call SetAbilityElement('A02O',3)
call SetAbilityElement('A01Y',3)
call SetAbilityElement('H008',3)
call SetAbilityElement('O001',3)
call SetAbilityElement('A08P',3)
call SetAbilityElement('O00A',3)
call SetAbilityElement('O00C',3)
call SetAbilityElement('A07E',3)
call SetAbilityElement('A079',3)
call SetAbilityElement('A07N',3)
call SetAbilityElement('A08J',3)
call SetAbilityElement('N00K',3)
//Earth 4
call SetAbilityElement('AOws',4)
call SetAbilityElement('AOsh',4)
call SetAbilityElement('Awar',4)
call SetAbilityElement('AEer',4)
call SetAbilityElement('ANvc',4)
call SetAbilityElement('A060',4)
call SetAbilityElement('A07D',4)
call SetAbilityElement('AHtc',4)
call SetAbilityElement('AUim',4)
call SetAbilityElement('AEsv',4)
call SetAbilityElement('A08F',4)
call SetAbilityElement('H01C',4)
call SetAbilityElement('A08U',4)
call SetAbilityElement('H017',4)
call SetAbilityElement('H019',4)
call SetAbilityElement('Assk',4)
call SetAbilityElement('AUin',4)
call SetAbilityElement('A07J',4)
call SetAbilityElement('A07L',4)
call SetAbilityElement('AHav',4)
call SetAbilityElement('A078',4)
call SetAbilityElement('H00A',4)
call SetAbilityElement('A083',4)
//Wild 5
call SetAbilityElement('A06X',5)
call SetAbilityElement('A08F',5)
call SetAbilityElement('AEer',5)
call SetAbilityElement('AEtq',5)
call SetAbilityElement('Afae',5)
call SetAbilityElement('Arej',5)
call SetAbilityElement('ANbr',5)
call SetAbilityElement('ANst',5)
call SetAbilityElement('Arsq',5)
call SetAbilityElement('ANsg',5)
call SetAbilityElement('ANsw',5)
call SetAbilityElement('N00P',5)
call SetAbilityElement('O008',5)
call SetAbilityElement('H006',5)
call SetAbilityElement('AEsv',5)
call SetAbilityElement('A07K',5)
//Energy 6
call SetAbilityElement('A06S',6)
call SetAbilityElement('A05Z',6)
call SetAbilityElement('A06U',6)
call SetAbilityElement('AHav',6)
call SetAbilityElement('AHtb',6)
call SetAbilityElement('AOea',6)
call SetAbilityElement('AOws',6)
call SetAbilityElement('AOsh',6)
call SetAbilityElement('Aakb',6)
call SetAbilityElement('Awar',6)
call SetAbilityElement('AEsf',6)
call SetAbilityElement('ANr2',6)
call SetAbilityElement('ACac',6)
call SetAbilityElement('ACpv',6)
call SetAbilityElement('A022',6)
call SetAbilityElement('A02X',6)
call SetAbilityElement('A040',6)
call SetAbilityElement('H01B',6)
call SetAbilityElement('A08T',6)
call SetAbilityElement('H01L',6)
call SetAbilityElement('H01J',6)
call SetAbilityElement('H000',6)
call SetAbilityElement('H01G',6)
call SetAbilityElement('O000',6)
call SetAbilityElement('A088',6)
call SetAbilityElement('A089',6)
call SetAbilityElement('A08J',6)
//Dark 7
call SetAbilityElement('A05R',7)
call SetAbilityElement('AUcb',7)
call SetAbilityElement('AUin',7)
call SetAbilityElement('AUau',7)
call SetAbilityElement('AUim',7)
call SetAbilityElement('AUdp',7)
call SetAbilityElement('AUdd',7)
call SetAbilityElement('AUcs',7)
call SetAbilityElement('AUts',7)
call SetAbilityElement('Aam2',7)
call SetAbilityElement('Arai',7)
call SetAbilityElement('Auhf',7)
call SetAbilityElement('Acrs',7)
call SetAbilityElement('ANsi',7)
call SetAbilityElement('ANdr',7)
call SetAbilityElement('ANht',7)
call SetAbilityElement('ANba',7)
call SetAbilityElement('Afod',7)
call SetAbilityElement('A042',7)
call SetAbilityElement('A02M',7)
call SetAbilityElement('A02K',7)
call SetAbilityElement('N00O',7)
call SetAbilityElement('N00B',7)
call SetAbilityElement('O003',7)
call SetAbilityElement('H000',7)
call SetAbilityElement('H005',7)
call SetAbilityElement('A07Q',7)
call SetAbilityElement('A023',7)
call SetAbilityElement('O002',7)
call SetAbilityElement('O003',7)
call SetAbilityElement('H018',7)
call SetAbilityElement('A08W',7)
call SetAbilityElement('A07X',7)
call SetAbilityElement('N00I',7)
//Light 8
call SetAbilityElement('A05R',8)
call SetAbilityElement('AHad',8)
call SetAbilityElement('AHds',8)
call SetAbilityElement('AHhb',8)
call SetAbilityElement('Ainf',8)
call SetAbilityElement('AOhw',8)
call SetAbilityElement('Ahwd',8)
call SetAbilityElement('AEtq',8)
call SetAbilityElement('Arej',8)
call SetAbilityElement('ANr2',8)
call SetAbilityElement('A04E',8)
call SetAbilityElement('A041',8)
call SetAbilityElement('A03X',8)
call SetAbilityElement('A04K',8)
call SetAbilityElement('A03Q',8)
call SetAbilityElement('A045',8)
call SetAbilityElement('A02L',8)
call SetAbilityElement('H002',8)
call SetAbilityElement('E000',8)
call SetAbilityElement('A07P',8)
call SetAbilityElement('A04G',8)
call SetAbilityElement('A082',8)
// Cold 9
call SetAbilityElement('A053',9)
call SetAbilityElement('AHbz',9)
call SetAbilityElement('AUfn',9)
call SetAbilityElement('AUfu',9)
call SetAbilityElement('AHca',9)
call SetAbilityElement('ANht',9)
call SetAbilityElement('H018',9)
call SetAbilityElement('A08W',9)
call SetAbilityElement('N02K',9)
call SetAbilityElement('A07N',9)
call SetAbilityElement('A02Z',9)
call SetAbilityElement('A07X',9)
call SetAbilityElement('A07V',9)
call SetAbilityElement('A080',9)
call SetAbilityElement('A046',9)



// Posion 10
call SetAbilityElement('A06O',10)
call SetAbilityElement('AEsh',10)
call SetAbilityElement('ANab',10)
call SetAbilityElement('ANdh',10)
call SetAbilityElement('ACvs',10)
call SetAbilityElement('ANpa',10)
call SetAbilityElement('ANhs',10)
// Blood 11
call SetAbilityElement('A067',11)
call SetAbilityElement('AOcr',11)
call SetAbilityElement('Absk',11)
call SetAbilityElement('Ablo',11)
call SetAbilityElement('AUav',11)
call SetAbilityElement('A02N',11)
call SetAbilityElement('A02K',11)
call SetAbilityElement('H007',11)
call SetAbilityElement('N00C',11)
call SetAbilityElement('O002',11)
call SetAbilityElement('A07R',11)
call SetAbilityElement('A023',11)
call SetAbilityElement('A07T',11)
call SetAbilityElement('N024',11)
call SetAbilityElement('H01H',11)
call SetAbilityElement('A081',11)
call SetAbilityElement('N00Q',11)
call SetAbilityElement('N00I',11)
//divinity 12
call SetAbilityElement('A07S',12)
call SetAbilityElement('A04E',12)
call SetAbilityElement('A045',12)
call SetAbilityElement('A02L',12)
call SetAbilityElement('A082',12)
//arcane 13
call SetAbilityElement('A06U',13)
call SetAbilityElement('A05Z',13)
call SetAbilityElement('A03Y',13)
call SetAbilityElement('A022',13)
call SetAbilityElement('A03P',13)
call SetAbilityElement('A06Z',13)
call SetAbilityElement('H01L',13)
call SetAbilityElement('H01E',13)
call SetAbilityElement('O004',13)
call SetAbilityElement('A083',13)
call SetAbilityElement('A088',13)
call SetAbilityElement('A08J',13)
call SetAbilityElement('A08I',13)
//Time 14
call SetAbilityElement('A03Y',14)
call SetAbilityElement('A022',14)
call SetAbilityElement('A040',14)
call SetAbilityElement('A083',14)
call SetAbilityElement('A08I',14)

//Spirit 15
call SetAbilityElement('H01D',15)
call SetAbilityElement('H01I',15)
call SetAbilityElement('O003',15)
call SetAbilityElement('A08I',15)


call SetAbilityElement('A07U',1)
call SetAbilityElement('A07U',2)
call SetAbilityElement('A07U',3)
call SetAbilityElement('A07U',4)
call SetAbilityElement('A07U',5)
call SetAbilityElement('A07U',6)
call SetAbilityElement('A07U',7)
call SetAbilityElement('A07U',8)
call SetAbilityElement('A07U',9)
call SetAbilityElement('A07U',10)
call SetAbilityElement('A07U',11)
call SetAbilityElement('A07U',12)
call SetAbilityElement('A07U',13)
call SetAbilityElement('A07U',14)

call SetAbilityElement('A04L',1)
call SetAbilityElement('A04L',2)
call SetAbilityElement('A04L',3)
call SetAbilityElement('A04L',4)
call SetAbilityElement('A04L',5)
call SetAbilityElement('A04L',6)
call SetAbilityElement('A04L',7)
call SetAbilityElement('A04L',8)
call SetAbilityElement('A04L',9)
call SetAbilityElement('A04L',10)
call SetAbilityElement('A04L',11)
call SetAbilityElement('A04L',12)
call SetAbilityElement('A04L',13)
call SetAbilityElement('A04L',14)
endfunction

//===========================================================================
function InitTrig_InitElements takes nothing returns nothing
    set gg_trg_InitElements = CreateTrigger(  )
    call TriggerAddAction( gg_trg_InitElements, function Trig_InitElements_Actions )
endfunction

