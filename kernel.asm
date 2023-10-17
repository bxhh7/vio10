
kernel.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <mb_magic>:
  100000:	02 b0 ad 1b                                         ....

00100004 <mb_flags>:
  100004:	07 00 00 00                                         ....

00100008 <mb_checksum>:
  100008:	f7 4f 52 e4                                         .OR.

0010000c <mb_pading>:
  10000c:	01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01     ................
  10001c:	01 01 01                                            ...

0010001f <mb_mode_type>:
  10001f:	01 00 00 00                                         ....

00100023 <mb_width>:
  100023:	00 00 00 00                                         ....

00100027 <mb_height>:
  100027:	00 00 00 00 66 90 66 90 90                          ....f.f..

00100030 <entry>:
  100030:	bc 00 40 20 00       	mov    $0x204000,%esp
  100035:	c6 05 00 b0 08 00 58 	movb   $0x58,0x8b000
  10003c:	53                   	push   %ebx
  10003d:	e8 0a 00 00 00       	call   10004c <kmain>
  100042:	fa                   	cli
  100043:	f4                   	hlt
  100044:	eb fe                	jmp    100044 <entry+0x14>

00100046 <func>:
  100046:	55                   	push   %ebp
  100047:	89 e5                	mov    %esp,%ebp
  100049:	90                   	nop
  10004a:	5d                   	pop    %ebp
  10004b:	c3                   	ret

0010004c <kmain>:
  10004c:	55                   	push   %ebp
  10004d:	89 e5                	mov    %esp,%ebp
  10004f:	83 ec 68             	sub    $0x68,%esp
  100052:	c7 45 dc 00 80 0b 00 	movl   $0xb8000,-0x24(%ebp)
  100059:	68 34 26 10 00       	push   $0x102634
  10005e:	e8 e3 ff ff ff       	call   100046 <func>
  100063:	83 c4 04             	add    $0x4,%esp
  100066:	68 04 34 10 00       	push   $0x103404
  10006b:	e8 d6 ff ff ff       	call   100046 <func>
  100070:	83 c4 04             	add    $0x4,%esp
  100073:	68 c8 48 40 00       	push   $0x4048c8
  100078:	e8 c9 ff ff ff       	call   100046 <func>
  10007d:	83 c4 04             	add    $0x4,%esp
  100080:	68 00 00 10 00       	push   $0x100000
  100085:	e8 bc ff ff ff       	call   100046 <func>
  10008a:	83 c4 04             	add    $0x4,%esp
  10008d:	c7 45 d8 cc 22 10 00 	movl   $0x1022cc,-0x28(%ebp)
  100094:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10009b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10009e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1000a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1000a8:	eb 0f                	jmp    1000b9 <kmain+0x6d>
  1000aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1000ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1000b0:	01 d0                	add    %edx,%eax
  1000b2:	c6 00 20             	movb   $0x20,(%eax)
  1000b5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  1000b9:	81 7d ec 1f 08 00 00 	cmpl   $0x81f,-0x14(%ebp)
  1000c0:	7e e8                	jle    1000aa <kmain+0x5e>
  1000c2:	eb 18                	jmp    1000dc <kmain+0x90>
  1000c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1000c7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1000ca:	01 c2                	add    %eax,%edx
  1000cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1000cf:	0f b6 00             	movzbl (%eax),%eax
  1000d2:	88 02                	mov    %al,(%edx)
  1000d4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  1000d8:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
  1000dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1000df:	0f b6 00             	movzbl (%eax),%eax
  1000e2:	84 c0                	test   %al,%al
  1000e4:	75 de                	jne    1000c4 <kmain+0x78>
  1000e6:	e8 bb 0c 00 00       	call   100da6 <cli>
  1000eb:	e8 f7 03 00 00       	call   1004e7 <init_segmentation>
  1000f0:	e8 f0 0e 00 00       	call   100fe5 <init_interrupts>
  1000f5:	e8 a5 0c 00 00       	call   100d9f <sti>
  1000fa:	cd 6f                	int    $0x6f
  1000fc:	cd 28                	int    $0x28
  1000fe:	cd 71                	int    $0x71
  100100:	cd 72                	int    $0x72
  100102:	cd 22                	int    $0x22
  100104:	83 ec 08             	sub    $0x8,%esp
  100107:	68 00 c2 01 00       	push   $0x1c200
  10010c:	68 f8 03 00 00       	push   $0x3f8
  100111:	e8 1d 1d 00 00       	call   101e33 <uart_init>
  100116:	83 c4 10             	add    $0x10,%esp
  100119:	83 ec 08             	sub    $0x8,%esp
  10011c:	68 e0 22 10 00       	push   $0x1022e0
  100121:	68 d8 1f 10 00       	push   $0x101fd8
  100126:	e8 28 20 00 00       	call   102153 <generic_printf>
  10012b:	83 c4 10             	add    $0x10,%esp
  10012e:	8b 45 08             	mov    0x8(%ebp),%eax
  100131:	8b 40 08             	mov    0x8(%eax),%eax
  100134:	c1 e0 0a             	shl    $0xa,%eax
  100137:	83 ec 08             	sub    $0x8,%esp
  10013a:	50                   	push   %eax
  10013b:	68 c8 48 40 00       	push   $0x4048c8
  100140:	e8 14 05 00 00       	call   100659 <pmm_init>
  100145:	83 c4 10             	add    $0x10,%esp
  100148:	c7 45 d4 e7 22 10 00 	movl   $0x1022e7,-0x2c(%ebp)
  10014f:	e8 cc 05 00 00       	call   100720 <pmm_alloc>
  100154:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100157:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  10015e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100161:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100164:	eb 1d                	jmp    100183 <kmain+0x137>
  100166:	8b 55 e8             	mov    -0x18(%ebp),%edx
  100169:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10016c:	01 d0                	add    %edx,%eax
  10016e:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100171:	8b 55 d0             	mov    -0x30(%ebp),%edx
  100174:	01 ca                	add    %ecx,%edx
  100176:	0f b6 00             	movzbl (%eax),%eax
  100179:	88 02                	mov    %al,(%edx)
  10017b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  10017f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  100183:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100186:	0f b6 00             	movzbl (%eax),%eax
  100189:	84 c0                	test   %al,%al
  10018b:	75 d9                	jne    100166 <kmain+0x11a>
  10018d:	83 ec 04             	sub    $0x4,%esp
  100190:	ff 75 d0             	push   -0x30(%ebp)
  100193:	68 f4 22 10 00       	push   $0x1022f4
  100198:	68 d8 1f 10 00       	push   $0x101fd8
  10019d:	e8 b1 1f 00 00       	call   102153 <generic_printf>
  1001a2:	83 c4 10             	add    $0x10,%esp
  1001a5:	e8 76 05 00 00       	call   100720 <pmm_alloc>
  1001aa:	89 45 cc             	mov    %eax,-0x34(%ebp)
  1001ad:	e8 6e 05 00 00       	call   100720 <pmm_alloc>
  1001b2:	89 45 c8             	mov    %eax,-0x38(%ebp)
  1001b5:	e8 66 05 00 00       	call   100720 <pmm_alloc>
  1001ba:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  1001bd:	e8 5e 05 00 00       	call   100720 <pmm_alloc>
  1001c2:	89 45 c0             	mov    %eax,-0x40(%ebp)
  1001c5:	e8 56 05 00 00       	call   100720 <pmm_alloc>
  1001ca:	89 45 bc             	mov    %eax,-0x44(%ebp)
  1001cd:	e8 4e 05 00 00       	call   100720 <pmm_alloc>
  1001d2:	89 45 b8             	mov    %eax,-0x48(%ebp)
  1001d5:	e8 46 05 00 00       	call   100720 <pmm_alloc>
  1001da:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  1001dd:	e8 3e 05 00 00       	call   100720 <pmm_alloc>
  1001e2:	89 45 b0             	mov    %eax,-0x50(%ebp)
  1001e5:	83 ec 0c             	sub    $0xc,%esp
  1001e8:	ff 75 d0             	push   -0x30(%ebp)
  1001eb:	e8 c6 05 00 00       	call   1007b6 <pmm_free>
  1001f0:	83 c4 10             	add    $0x10,%esp
  1001f3:	e8 28 05 00 00       	call   100720 <pmm_alloc>
  1001f8:	89 45 ac             	mov    %eax,-0x54(%ebp)
  1001fb:	83 ec 0c             	sub    $0xc,%esp
  1001fe:	ff 75 cc             	push   -0x34(%ebp)
  100201:	e8 b0 05 00 00       	call   1007b6 <pmm_free>
  100206:	83 c4 10             	add    $0x10,%esp
  100209:	83 ec 0c             	sub    $0xc,%esp
  10020c:	ff 75 c8             	push   -0x38(%ebp)
  10020f:	e8 a2 05 00 00       	call   1007b6 <pmm_free>
  100214:	83 c4 10             	add    $0x10,%esp
  100217:	83 ec 0c             	sub    $0xc,%esp
  10021a:	ff 75 c4             	push   -0x3c(%ebp)
  10021d:	e8 94 05 00 00       	call   1007b6 <pmm_free>
  100222:	83 c4 10             	add    $0x10,%esp
  100225:	83 ec 0c             	sub    $0xc,%esp
  100228:	ff 75 c0             	push   -0x40(%ebp)
  10022b:	e8 86 05 00 00       	call   1007b6 <pmm_free>
  100230:	83 c4 10             	add    $0x10,%esp
  100233:	83 ec 0c             	sub    $0xc,%esp
  100236:	ff 75 bc             	push   -0x44(%ebp)
  100239:	e8 78 05 00 00       	call   1007b6 <pmm_free>
  10023e:	83 c4 10             	add    $0x10,%esp
  100241:	83 ec 0c             	sub    $0xc,%esp
  100244:	ff 75 b4             	push   -0x4c(%ebp)
  100247:	e8 6a 05 00 00       	call   1007b6 <pmm_free>
  10024c:	83 c4 10             	add    $0x10,%esp
  10024f:	83 ec 0c             	sub    $0xc,%esp
  100252:	ff 75 b0             	push   -0x50(%ebp)
  100255:	e8 5c 05 00 00       	call   1007b6 <pmm_free>
  10025a:	83 c4 10             	add    $0x10,%esp
  10025d:	83 ec 0c             	sub    $0xc,%esp
  100260:	ff 75 ac             	push   -0x54(%ebp)
  100263:	e8 4e 05 00 00       	call   1007b6 <pmm_free>
  100268:	83 c4 10             	add    $0x10,%esp
  10026b:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
  10026f:	83 c8 01             	or     $0x1,%eax
  100272:	88 45 a0             	mov    %al,-0x60(%ebp)
  100275:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
  100279:	83 c8 02             	or     $0x2,%eax
  10027c:	88 45 a0             	mov    %al,-0x60(%ebp)
  10027f:	e8 9c 04 00 00       	call   100720 <pmm_alloc>
  100284:	c1 e8 0c             	shr    $0xc,%eax
  100287:	25 ff ff 0f 00       	and    $0xfffff,%eax
  10028c:	c1 e0 0c             	shl    $0xc,%eax
  10028f:	89 c2                	mov    %eax,%edx
  100291:	8b 45 a0             	mov    -0x60(%ebp),%eax
  100294:	25 ff 0f 00 00       	and    $0xfff,%eax
  100299:	09 d0                	or     %edx,%eax
  10029b:	89 45 a0             	mov    %eax,-0x60(%ebp)
  10029e:	8b 45 a0             	mov    -0x60(%ebp),%eax
  1002a1:	83 ec 04             	sub    $0x4,%esp
  1002a4:	50                   	push   %eax
  1002a5:	68 2a 23 10 00       	push   $0x10232a
  1002aa:	68 d8 1f 10 00       	push   $0x101fd8
  1002af:	e8 9f 1e 00 00       	call   102153 <generic_printf>
  1002b4:	83 c4 10             	add    $0x10,%esp
  1002b7:	83 ec 0c             	sub    $0xc,%esp
  1002ba:	6a 0b                	push   $0xb
  1002bc:	68 db 02 00 00       	push   $0x2db
  1002c1:	68 7a 03 00 00       	push   $0x37a
  1002c6:	68 3c 23 10 00       	push   $0x10233c
  1002cb:	68 d8 1f 10 00       	push   $0x101fd8
  1002d0:	e8 7e 1e 00 00       	call   102153 <generic_printf>
  1002d5:	83 c4 20             	add    $0x20,%esp
  1002d8:	83 ec 04             	sub    $0x4,%esp
  1002db:	68 0b b0 ad de       	push   $0xdeadb00b
  1002e0:	68 64 23 10 00       	push   $0x102364
  1002e5:	68 d8 1f 10 00       	push   $0x101fd8
  1002ea:	e8 64 1e 00 00       	call   102153 <generic_printf>
  1002ef:	83 c4 10             	add    $0x10,%esp
  1002f2:	e8 29 04 00 00       	call   100720 <pmm_alloc>
  1002f7:	89 45 a8             	mov    %eax,-0x58(%ebp)
  1002fa:	83 ec 04             	sub    $0x4,%esp
  1002fd:	68 00 10 00 00       	push   $0x1000
  100302:	6a 00                	push   $0x0
  100304:	ff 75 a8             	push   -0x58(%ebp)
  100307:	e8 10 1d 00 00       	call   10201c <memset>
  10030c:	83 c4 10             	add    $0x10,%esp
  10030f:	83 ec 04             	sub    $0x4,%esp
  100312:	6a 01                	push   $0x1
  100314:	68 0b b0 ad de       	push   $0xdeadb00b
  100319:	ff 75 a8             	push   -0x58(%ebp)
  10031c:	e8 56 06 00 00       	call   100977 <vmm_walk>
  100321:	83 c4 10             	add    $0x10,%esp
  100324:	83 ec 04             	sub    $0x4,%esp
  100327:	6a 01                	push   $0x1
  100329:	6a 00                	push   $0x0
  10032b:	ff 75 a8             	push   -0x58(%ebp)
  10032e:	e8 44 06 00 00       	call   100977 <vmm_walk>
  100333:	83 c4 10             	add    $0x10,%esp
  100336:	83 ec 04             	sub    $0x4,%esp
  100339:	6a 01                	push   $0x1
  10033b:	6a 0f                	push   $0xf
  10033d:	ff 75 a8             	push   -0x58(%ebp)
  100340:	e8 32 06 00 00       	call   100977 <vmm_walk>
  100345:	83 c4 10             	add    $0x10,%esp
  100348:	83 ec 04             	sub    $0x4,%esp
  10034b:	6a 01                	push   $0x1
  10034d:	68 ff ff 00 00       	push   $0xffff
  100352:	ff 75 a8             	push   -0x58(%ebp)
  100355:	e8 1d 06 00 00       	call   100977 <vmm_walk>
  10035a:	83 c4 10             	add    $0x10,%esp
  10035d:	83 ec 04             	sub    $0x4,%esp
  100360:	6a 01                	push   $0x1
  100362:	68 be ba fe ca       	push   $0xcafebabe
  100367:	ff 75 a8             	push   -0x58(%ebp)
  10036a:	e8 08 06 00 00       	call   100977 <vmm_walk>
  10036f:	83 c4 10             	add    $0x10,%esp
  100372:	e8 2f 0a 00 00       	call   100da6 <cli>
  100377:	e8 73 07 00 00       	call   100aef <vmm_setup_kpgdir>
  10037c:	a3 bc 40 40 00       	mov    %eax,0x4040bc
  100381:	a1 bc 40 40 00       	mov    0x4040bc,%eax
  100386:	83 ec 0c             	sub    $0xc,%esp
  100389:	50                   	push   %eax
  10038a:	e8 54 07 00 00       	call   100ae3 <load_cr3>
  10038f:	83 c4 10             	add    $0x10,%esp
  100392:	a1 bc 40 40 00       	mov    0x4040bc,%eax
  100397:	83 ec 0c             	sub    $0xc,%esp
  10039a:	50                   	push   %eax
  10039b:	e8 85 07 00 00       	call   100b25 <print_pgdir>
  1003a0:	83 c4 10             	add    $0x10,%esp
  1003a3:	e8 58 1c 00 00       	call   102000 <enable_paging>
  1003a8:	e8 f2 09 00 00       	call   100d9f <sti>
  1003ad:	c7 45 a4 01 50 50 00 	movl   $0x505001,-0x5c(%ebp)
  1003b4:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  1003b7:	c6 00 41             	movb   $0x41,(%eax)
  1003ba:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  1003c1:	eb 4b                	jmp    10040e <kmain+0x3c2>
  1003c3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1003c6:	8d 48 15             	lea    0x15(%eax),%ecx
  1003c9:	ba 83 20 08 82       	mov    $0x82082083,%edx
  1003ce:	89 c8                	mov    %ecx,%eax
  1003d0:	f7 ea                	imul   %edx
  1003d2:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  1003d5:	c1 f8 06             	sar    $0x6,%eax
  1003d8:	89 ca                	mov    %ecx,%edx
  1003da:	c1 fa 1f             	sar    $0x1f,%edx
  1003dd:	29 d0                	sub    %edx,%eax
  1003df:	6b d0 7e             	imul   $0x7e,%eax,%edx
  1003e2:	89 c8                	mov    %ecx,%eax
  1003e4:	29 d0                	sub    %edx,%eax
  1003e6:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  1003e9:	8b 55 a4             	mov    -0x5c(%ebp),%edx
  1003ec:	01 ca                	add    %ecx,%edx
  1003ee:	88 02                	mov    %al,(%edx)
  1003f0:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1003f3:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  1003f6:	01 d0                	add    %edx,%eax
  1003f8:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1003fb:	83 c2 64             	add    $0x64,%edx
  1003fe:	89 d1                	mov    %edx,%ecx
  100400:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100403:	01 ca                	add    %ecx,%edx
  100405:	0f b6 00             	movzbl (%eax),%eax
  100408:	88 02                	mov    %al,(%edx)
  10040a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  10040e:	81 7d e0 ff ff 0f 00 	cmpl   $0xfffff,-0x20(%ebp)
  100415:	7e ac                	jle    1003c3 <kmain+0x377>
  100417:	8b 45 08             	mov    0x8(%ebp),%eax
  10041a:	8b 40 04             	mov    0x4(%eax),%eax
  10041d:	c9                   	leave
  10041e:	c3                   	ret

0010041f <make_segment>:
  10041f:	55                   	push   %ebp
  100420:	89 e5                	mov    %esp,%ebp
  100422:	83 ec 18             	sub    $0x18,%esp
  100425:	8b 55 14             	mov    0x14(%ebp),%edx
  100428:	8b 45 18             	mov    0x18(%ebp),%eax
  10042b:	88 55 ec             	mov    %dl,-0x14(%ebp)
  10042e:	88 45 e8             	mov    %al,-0x18(%ebp)
  100431:	8b 45 10             	mov    0x10(%ebp),%eax
  100434:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100438:	8b 45 10             	mov    0x10(%ebp),%eax
  10043b:	c1 e8 10             	shr    $0x10,%eax
  10043e:	83 e0 0f             	and    $0xf,%eax
  100441:	83 e0 0f             	and    $0xf,%eax
  100444:	89 c2                	mov    %eax,%edx
  100446:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  10044a:	83 e0 f0             	and    $0xfffffff0,%eax
  10044d:	09 d0                	or     %edx,%eax
  10044f:	88 45 fe             	mov    %al,-0x2(%ebp)
  100452:	8b 45 0c             	mov    0xc(%ebp),%eax
  100455:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  100459:	8b 45 0c             	mov    0xc(%ebp),%eax
  10045c:	c1 e8 10             	shr    $0x10,%eax
  10045f:	88 45 fc             	mov    %al,-0x4(%ebp)
  100462:	8b 45 0c             	mov    0xc(%ebp),%eax
  100465:	c1 e8 18             	shr    $0x18,%eax
  100468:	88 45 ff             	mov    %al,-0x1(%ebp)
  10046b:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  10046f:	88 45 fd             	mov    %al,-0x3(%ebp)
  100472:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  100476:	83 e0 ef             	and    $0xffffffef,%eax
  100479:	88 45 fe             	mov    %al,-0x2(%ebp)
  10047c:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  100480:	d0 e8                	shr    %al
  100482:	83 e0 01             	and    $0x1,%eax
  100485:	83 e0 01             	and    $0x1,%eax
  100488:	c1 e0 05             	shl    $0x5,%eax
  10048b:	89 c2                	mov    %eax,%edx
  10048d:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  100491:	83 e0 df             	and    $0xffffffdf,%eax
  100494:	09 d0                	or     %edx,%eax
  100496:	88 45 fe             	mov    %al,-0x2(%ebp)
  100499:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  10049d:	c0 e8 02             	shr    $0x2,%al
  1004a0:	83 e0 01             	and    $0x1,%eax
  1004a3:	83 e0 01             	and    $0x1,%eax
  1004a6:	c1 e0 06             	shl    $0x6,%eax
  1004a9:	89 c2                	mov    %eax,%edx
  1004ab:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  1004af:	83 e0 bf             	and    $0xffffffbf,%eax
  1004b2:	09 d0                	or     %edx,%eax
  1004b4:	88 45 fe             	mov    %al,-0x2(%ebp)
  1004b7:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  1004bb:	c0 e8 03             	shr    $0x3,%al
  1004be:	83 e0 01             	and    $0x1,%eax
  1004c1:	c1 e0 07             	shl    $0x7,%eax
  1004c4:	89 c2                	mov    %eax,%edx
  1004c6:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  1004ca:	83 e0 7f             	and    $0x7f,%eax
  1004cd:	09 d0                	or     %edx,%eax
  1004cf:	88 45 fe             	mov    %al,-0x2(%ebp)
  1004d2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1004d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004db:	89 01                	mov    %eax,(%ecx)
  1004dd:	89 51 04             	mov    %edx,0x4(%ecx)
  1004e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1004e3:	c9                   	leave
  1004e4:	c2 04 00             	ret    $0x4

001004e7 <init_segmentation>:
  1004e7:	55                   	push   %ebp
  1004e8:	89 e5                	mov    %esp,%ebp
  1004ea:	83 ec 18             	sub    $0x18,%esp
  1004ed:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1004f0:	6a 00                	push   $0x0
  1004f2:	6a 00                	push   $0x0
  1004f4:	6a 00                	push   $0x0
  1004f6:	6a 00                	push   $0x0
  1004f8:	50                   	push   %eax
  1004f9:	e8 21 ff ff ff       	call   10041f <make_segment>
  1004fe:	83 c4 10             	add    $0x10,%esp
  100501:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100504:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100507:	a3 00 40 40 00       	mov    %eax,0x404000
  10050c:	89 15 04 40 40 00    	mov    %edx,0x404004
  100512:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100515:	6a 0c                	push   $0xc
  100517:	68 9a 00 00 00       	push   $0x9a
  10051c:	68 ff ff 0f 00       	push   $0xfffff
  100521:	6a 00                	push   $0x0
  100523:	50                   	push   %eax
  100524:	e8 f6 fe ff ff       	call   10041f <make_segment>
  100529:	83 c4 10             	add    $0x10,%esp
  10052c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10052f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100532:	a3 08 40 40 00       	mov    %eax,0x404008
  100537:	89 15 0c 40 40 00    	mov    %edx,0x40400c
  10053d:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100540:	6a 0c                	push   $0xc
  100542:	68 92 00 00 00       	push   $0x92
  100547:	68 ff ff 0f 00       	push   $0xfffff
  10054c:	6a 00                	push   $0x0
  10054e:	50                   	push   %eax
  10054f:	e8 cb fe ff ff       	call   10041f <make_segment>
  100554:	83 c4 10             	add    $0x10,%esp
  100557:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10055a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10055d:	a3 10 40 40 00       	mov    %eax,0x404010
  100562:	89 15 14 40 40 00    	mov    %edx,0x404014
  100568:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10056b:	6a 0c                	push   $0xc
  10056d:	68 f2 00 00 00       	push   $0xf2
  100572:	68 ff ff 0f 00       	push   $0xfffff
  100577:	6a 00                	push   $0x0
  100579:	50                   	push   %eax
  10057a:	e8 a0 fe ff ff       	call   10041f <make_segment>
  10057f:	83 c4 10             	add    $0x10,%esp
  100582:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100585:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100588:	a3 18 40 40 00       	mov    %eax,0x404018
  10058d:	89 15 1c 40 40 00    	mov    %edx,0x40401c
  100593:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100596:	6a 0c                	push   $0xc
  100598:	68 fa 00 00 00       	push   $0xfa
  10059d:	68 ff ff 0f 00       	push   $0xfffff
  1005a2:	6a 00                	push   $0x0
  1005a4:	50                   	push   %eax
  1005a5:	e8 75 fe ff ff       	call   10041f <make_segment>
  1005aa:	83 c4 10             	add    $0x10,%esp
  1005ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1005b3:	a3 20 40 40 00       	mov    %eax,0x404020
  1005b8:	89 15 24 40 40 00    	mov    %edx,0x404024
  1005be:	83 ec 04             	sub    $0x4,%esp
  1005c1:	6a 68                	push   $0x68
  1005c3:	6a 00                	push   $0x0
  1005c5:	68 40 40 40 00       	push   $0x404040
  1005ca:	e8 4d 1a 00 00       	call   10201c <memset>
  1005cf:	83 c4 10             	add    $0x10,%esp
  1005d2:	b8 00 40 30 00       	mov    $0x304000,%eax
  1005d7:	a3 44 40 40 00       	mov    %eax,0x404044
  1005dc:	c7 05 48 40 40 00 10 	movl   $0x10,0x404048
  1005e3:	00 00 00 
  1005e6:	ba 40 40 40 00       	mov    $0x404040,%edx
  1005eb:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1005ee:	83 ec 0c             	sub    $0xc,%esp
  1005f1:	6a 00                	push   $0x0
  1005f3:	68 89 00 00 00       	push   $0x89
  1005f8:	6a 68                	push   $0x68
  1005fa:	52                   	push   %edx
  1005fb:	50                   	push   %eax
  1005fc:	e8 1e fe ff ff       	call   10041f <make_segment>
  100601:	83 c4 1c             	add    $0x1c,%esp
  100604:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100607:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10060a:	a3 28 40 40 00       	mov    %eax,0x404028
  10060f:	89 15 2c 40 40 00    	mov    %edx,0x40402c
  100615:	83 ec 08             	sub    $0x8,%esp
  100618:	6a 30                	push   $0x30
  10061a:	68 00 40 40 00       	push   $0x404000
  10061f:	e8 89 07 00 00       	call   100dad <lgdt>
  100624:	83 c4 10             	add    $0x10,%esp
  100627:	e8 40 25 00 00       	call   102b6c <flush_gdt>
  10062c:	e8 ef 07 00 00       	call   100e20 <flush_tss>
  100631:	90                   	nop
  100632:	c9                   	leave
  100633:	c3                   	ret

00100634 <page_roundup>:
  100634:	55                   	push   %ebp
  100635:	89 e5                	mov    %esp,%ebp
  100637:	81 45 08 00 10 00 00 	addl   $0x1000,0x8(%ebp)
  10063e:	81 65 08 00 f0 ff ff 	andl   $0xfffff000,0x8(%ebp)
  100645:	8b 45 08             	mov    0x8(%ebp),%eax
  100648:	5d                   	pop    %ebp
  100649:	c3                   	ret

0010064a <page_rounddown>:
  10064a:	55                   	push   %ebp
  10064b:	89 e5                	mov    %esp,%ebp
  10064d:	81 65 08 00 f0 ff ff 	andl   $0xfffff000,0x8(%ebp)
  100654:	8b 45 08             	mov    0x8(%ebp),%eax
  100657:	5d                   	pop    %ebp
  100658:	c3                   	ret

00100659 <pmm_init>:
  100659:	55                   	push   %ebp
  10065a:	89 e5                	mov    %esp,%ebp
  10065c:	83 ec 18             	sub    $0x18,%esp
  10065f:	8b 45 08             	mov    0x8(%ebp),%eax
  100662:	50                   	push   %eax
  100663:	e8 cc ff ff ff       	call   100634 <page_roundup>
  100668:	83 c4 04             	add    $0x4,%esp
  10066b:	89 45 08             	mov    %eax,0x8(%ebp)
  10066e:	c7 05 b8 40 40 00 00 	movl   $0x0,0x4040b8
  100675:	00 00 00 
  100678:	8b 45 08             	mov    0x8(%ebp),%eax
  10067b:	25 ff 0f 00 00       	and    $0xfff,%eax
  100680:	85 c0                	test   %eax,%eax
  100682:	74 19                	je     10069d <pmm_init+0x44>
  100684:	83 ec 04             	sub    $0x4,%esp
  100687:	ff 75 08             	push   0x8(%ebp)
  10068a:	68 84 23 10 00       	push   $0x102384
  10068f:	68 d8 1f 10 00       	push   $0x101fd8
  100694:	e8 ba 1a 00 00       	call   102153 <generic_printf>
  100699:	83 c4 10             	add    $0x10,%esp
  10069c:	f4                   	hlt
  10069d:	8b 45 08             	mov    0x8(%ebp),%eax
  1006a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1006a3:	eb 35                	jmp    1006da <pmm_init+0x81>
  1006a5:	a1 b4 40 40 00       	mov    0x4040b4,%eax
  1006aa:	83 c0 01             	add    $0x1,%eax
  1006ad:	a3 b4 40 40 00       	mov    %eax,0x4040b4
  1006b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1006b8:	8b 15 b8 40 40 00    	mov    0x4040b8,%edx
  1006be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006c1:	89 10                	mov    %edx,(%eax)
  1006c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006c6:	a3 b8 40 40 00       	mov    %eax,0x4040b8
  1006cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006ce:	a3 ac 40 40 00       	mov    %eax,0x4040ac
  1006d3:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  1006da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006dd:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1006e0:	72 c3                	jb     1006a5 <pmm_init+0x4c>
  1006e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006e5:	a3 a8 40 40 00       	mov    %eax,0x4040a8
  1006ea:	c7 05 b0 40 40 00 00 	movl   $0x0,0x4040b0
  1006f1:	00 00 00 
  1006f4:	8b 0d b4 40 40 00    	mov    0x4040b4,%ecx
  1006fa:	8b 15 ac 40 40 00    	mov    0x4040ac,%edx
  100700:	a1 a8 40 40 00       	mov    0x4040a8,%eax
  100705:	83 ec 0c             	sub    $0xc,%esp
  100708:	51                   	push   %ecx
  100709:	52                   	push   %edx
  10070a:	50                   	push   %eax
  10070b:	68 b0 23 10 00       	push   $0x1023b0
  100710:	68 d8 1f 10 00       	push   $0x101fd8
  100715:	e8 39 1a 00 00       	call   102153 <generic_printf>
  10071a:	83 c4 20             	add    $0x20,%esp
  10071d:	90                   	nop
  10071e:	c9                   	leave
  10071f:	c3                   	ret

00100720 <pmm_alloc>:
  100720:	55                   	push   %ebp
  100721:	89 e5                	mov    %esp,%ebp
  100723:	83 ec 18             	sub    $0x18,%esp
  100726:	8b 15 b0 40 40 00    	mov    0x4040b0,%edx
  10072c:	a1 b4 40 40 00       	mov    0x4040b4,%eax
  100731:	52                   	push   %edx
  100732:	50                   	push   %eax
  100733:	68 f8 23 10 00       	push   $0x1023f8
  100738:	68 d8 1f 10 00       	push   $0x101fd8
  10073d:	e8 11 1a 00 00       	call   102153 <generic_printf>
  100742:	83 c4 10             	add    $0x10,%esp
  100745:	a1 b4 40 40 00       	mov    0x4040b4,%eax
  10074a:	85 c0                	test   %eax,%eax
  10074c:	75 1c                	jne    10076a <pmm_alloc+0x4a>
  10074e:	83 ec 08             	sub    $0x8,%esp
  100751:	68 2c 24 10 00       	push   $0x10242c
  100756:	68 d8 1f 10 00       	push   $0x101fd8
  10075b:	e8 f3 19 00 00       	call   102153 <generic_printf>
  100760:	83 c4 10             	add    $0x10,%esp
  100763:	b8 00 00 00 00       	mov    $0x0,%eax
  100768:	eb 4a                	jmp    1007b4 <pmm_alloc+0x94>
  10076a:	a1 b8 40 40 00       	mov    0x4040b8,%eax
  10076f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100772:	a1 b8 40 40 00       	mov    0x4040b8,%eax
  100777:	8b 00                	mov    (%eax),%eax
  100779:	a3 b8 40 40 00       	mov    %eax,0x4040b8
  10077e:	a1 b4 40 40 00       	mov    0x4040b4,%eax
  100783:	83 e8 01             	sub    $0x1,%eax
  100786:	a3 b4 40 40 00       	mov    %eax,0x4040b4
  10078b:	a1 b0 40 40 00       	mov    0x4040b0,%eax
  100790:	83 c0 01             	add    $0x1,%eax
  100793:	a3 b0 40 40 00       	mov    %eax,0x4040b0
  100798:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10079b:	83 ec 04             	sub    $0x4,%esp
  10079e:	50                   	push   %eax
  10079f:	68 30 24 10 00       	push   $0x102430
  1007a4:	68 d8 1f 10 00       	push   $0x101fd8
  1007a9:	e8 a5 19 00 00       	call   102153 <generic_printf>
  1007ae:	83 c4 10             	add    $0x10,%esp
  1007b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b4:	c9                   	leave
  1007b5:	c3                   	ret

001007b6 <pmm_free>:
  1007b6:	55                   	push   %ebp
  1007b7:	89 e5                	mov    %esp,%ebp
  1007b9:	83 ec 18             	sub    $0x18,%esp
  1007bc:	8b 15 b0 40 40 00    	mov    0x4040b0,%edx
  1007c2:	a1 b4 40 40 00       	mov    0x4040b4,%eax
  1007c7:	52                   	push   %edx
  1007c8:	50                   	push   %eax
  1007c9:	68 4c 24 10 00       	push   $0x10244c
  1007ce:	68 d8 1f 10 00       	push   $0x101fd8
  1007d3:	e8 7b 19 00 00       	call   102153 <generic_printf>
  1007d8:	83 c4 10             	add    $0x10,%esp
  1007db:	8b 45 08             	mov    0x8(%ebp),%eax
  1007de:	83 ec 04             	sub    $0x4,%esp
  1007e1:	50                   	push   %eax
  1007e2:	68 7f 24 10 00       	push   $0x10247f
  1007e7:	68 d8 1f 10 00       	push   $0x101fd8
  1007ec:	e8 62 19 00 00       	call   102153 <generic_printf>
  1007f1:	83 c4 10             	add    $0x10,%esp
  1007f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1007f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1007fa:	8b 15 b8 40 40 00    	mov    0x4040b8,%edx
  100800:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100803:	89 10                	mov    %edx,(%eax)
  100805:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100808:	a3 b8 40 40 00       	mov    %eax,0x4040b8
  10080d:	a1 b0 40 40 00       	mov    0x4040b0,%eax
  100812:	83 e8 01             	sub    $0x1,%eax
  100815:	a3 b0 40 40 00       	mov    %eax,0x4040b0
  10081a:	a1 b4 40 40 00       	mov    0x4040b4,%eax
  10081f:	83 c0 01             	add    $0x1,%eax
  100822:	a3 b4 40 40 00       	mov    %eax,0x4040b4
  100827:	90                   	nop
  100828:	c9                   	leave
  100829:	c3                   	ret

0010082a <vmm_map_kernel>:
  10082a:	55                   	push   %ebp
  10082b:	89 e5                	mov    %esp,%ebp
  10082d:	83 ec 08             	sub    $0x8,%esp
  100830:	ba c8 48 40 00       	mov    $0x4048c8,%edx
  100835:	b8 00 00 10 00       	mov    $0x100000,%eax
  10083a:	01 d0                	add    %edx,%eax
  10083c:	6a 00                	push   $0x0
  10083e:	50                   	push   %eax
  10083f:	6a 00                	push   $0x0
  100841:	ff 75 08             	push   0x8(%ebp)
  100844:	e8 06 00 00 00       	call   10084f <vmm_map>
  100849:	83 c4 10             	add    $0x10,%esp
  10084c:	90                   	nop
  10084d:	c9                   	leave
  10084e:	c3                   	ret

0010084f <vmm_map>:
  10084f:	55                   	push   %ebp
  100850:	89 e5                	mov    %esp,%ebp
  100852:	53                   	push   %ebx
  100853:	83 ec 14             	sub    $0x14,%esp
  100856:	8b 55 14             	mov    0x14(%ebp),%edx
  100859:	8b 45 10             	mov    0x10(%ebp),%eax
  10085c:	01 c2                	add    %eax,%edx
  10085e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100861:	8b 45 10             	mov    0x10(%ebp),%eax
  100864:	01 c8                	add    %ecx,%eax
  100866:	83 ec 08             	sub    $0x8,%esp
  100869:	52                   	push   %edx
  10086a:	ff 75 14             	push   0x14(%ebp)
  10086d:	50                   	push   %eax
  10086e:	ff 75 0c             	push   0xc(%ebp)
  100871:	68 98 24 10 00       	push   $0x102498
  100876:	68 d8 1f 10 00       	push   $0x101fd8
  10087b:	e8 d3 18 00 00       	call   102153 <generic_printf>
  100880:	83 c4 20             	add    $0x20,%esp
  100883:	8b 45 0c             	mov    0xc(%ebp),%eax
  100886:	83 ec 0c             	sub    $0xc,%esp
  100889:	50                   	push   %eax
  10088a:	e8 bb fd ff ff       	call   10064a <page_rounddown>
  10088f:	83 c4 10             	add    $0x10,%esp
  100892:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100895:	8b 45 14             	mov    0x14(%ebp),%eax
  100898:	83 ec 0c             	sub    $0xc,%esp
  10089b:	50                   	push   %eax
  10089c:	e8 a9 fd ff ff       	call   10064a <page_rounddown>
  1008a1:	83 c4 10             	add    $0x10,%esp
  1008a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1008a7:	e9 b3 00 00 00       	jmp    10095f <vmm_map+0x110>
  1008ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1008af:	c1 e8 16             	shr    $0x16,%eax
  1008b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1008b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1008b8:	83 ec 04             	sub    $0x4,%esp
  1008bb:	6a 01                	push   $0x1
  1008bd:	50                   	push   %eax
  1008be:	ff 75 08             	push   0x8(%ebp)
  1008c1:	e8 b1 00 00 00       	call   100977 <vmm_walk>
  1008c6:	83 c4 10             	add    $0x10,%esp
  1008c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1008cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008cf:	0f b6 00             	movzbl (%eax),%eax
  1008d2:	83 e0 01             	and    $0x1,%eax
  1008d5:	84 c0                	test   %al,%al
  1008d7:	74 16                	je     1008ef <vmm_map+0xa0>
  1008d9:	83 ec 08             	sub    $0x8,%esp
  1008dc:	68 cd 24 10 00       	push   $0x1024cd
  1008e1:	68 d8 1f 10 00       	push   $0x101fd8
  1008e6:	e8 68 18 00 00       	call   102153 <generic_printf>
  1008eb:	83 c4 10             	add    $0x10,%esp
  1008ee:	f4                   	hlt
  1008ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008f2:	c1 e8 0c             	shr    $0xc,%eax
  1008f5:	25 ff ff 0f 00       	and    $0xfffff,%eax
  1008fa:	89 c2                	mov    %eax,%edx
  1008fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008ff:	89 d1                	mov    %edx,%ecx
  100901:	83 e1 0f             	and    $0xf,%ecx
  100904:	89 cb                	mov    %ecx,%ebx
  100906:	c1 e3 04             	shl    $0x4,%ebx
  100909:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
  10090d:	83 e1 0f             	and    $0xf,%ecx
  100910:	09 d9                	or     %ebx,%ecx
  100912:	88 48 01             	mov    %cl,0x1(%eax)
  100915:	89 d1                	mov    %edx,%ecx
  100917:	c1 e9 04             	shr    $0x4,%ecx
  10091a:	0f b6 d9             	movzbl %cl,%ebx
  10091d:	0f b6 48 02          	movzbl 0x2(%eax),%ecx
  100921:	83 e1 00             	and    $0x0,%ecx
  100924:	09 d9                	or     %ebx,%ecx
  100926:	88 48 02             	mov    %cl,0x2(%eax)
  100929:	c1 ea 0c             	shr    $0xc,%edx
  10092c:	0f b6 ca             	movzbl %dl,%ecx
  10092f:	0f b6 50 03          	movzbl 0x3(%eax),%edx
  100933:	83 e2 00             	and    $0x0,%edx
  100936:	09 ca                	or     %ecx,%edx
  100938:	88 50 03             	mov    %dl,0x3(%eax)
  10093b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10093e:	0f b6 10             	movzbl (%eax),%edx
  100941:	83 ca 01             	or     $0x1,%edx
  100944:	88 10                	mov    %dl,(%eax)
  100946:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100949:	0f b6 10             	movzbl (%eax),%edx
  10094c:	83 ca 02             	or     $0x2,%edx
  10094f:	88 10                	mov    %dl,(%eax)
  100951:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  100958:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  10095f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100962:	8b 45 10             	mov    0x10(%ebp),%eax
  100965:	01 d0                	add    %edx,%eax
  100967:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10096a:	0f 82 3c ff ff ff    	jb     1008ac <vmm_map+0x5d>
  100970:	90                   	nop
  100971:	90                   	nop
  100972:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100975:	c9                   	leave
  100976:	c3                   	ret

00100977 <vmm_walk>:
  100977:	55                   	push   %ebp
  100978:	89 e5                	mov    %esp,%ebp
  10097a:	53                   	push   %ebx
  10097b:	83 ec 24             	sub    $0x24,%esp
  10097e:	8b 45 10             	mov    0x10(%ebp),%eax
  100981:	88 45 e4             	mov    %al,-0x1c(%ebp)
  100984:	8b 45 0c             	mov    0xc(%ebp),%eax
  100987:	c1 e8 16             	shr    $0x16,%eax
  10098a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  10098e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100992:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100999:	8b 45 08             	mov    0x8(%ebp),%eax
  10099c:	01 d0                	add    %edx,%eax
  10099e:	8b 00                	mov    (%eax),%eax
  1009a0:	85 c0                	test   %eax,%eax
  1009a2:	0f 85 ed 00 00 00    	jne    100a95 <vmm_walk+0x11e>
  1009a8:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
  1009ac:	0f 84 e3 00 00 00    	je     100a95 <vmm_walk+0x11e>
  1009b2:	e8 69 fd ff ff       	call   100720 <pmm_alloc>
  1009b7:	c1 e8 0c             	shr    $0xc,%eax
  1009ba:	89 c2                	mov    %eax,%edx
  1009bc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1009c0:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  1009c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1009ca:	01 c8                	add    %ecx,%eax
  1009cc:	81 e2 ff ff 0f 00    	and    $0xfffff,%edx
  1009d2:	89 d1                	mov    %edx,%ecx
  1009d4:	83 e1 0f             	and    $0xf,%ecx
  1009d7:	89 cb                	mov    %ecx,%ebx
  1009d9:	c1 e3 04             	shl    $0x4,%ebx
  1009dc:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
  1009e0:	83 e1 0f             	and    $0xf,%ecx
  1009e3:	09 d9                	or     %ebx,%ecx
  1009e5:	88 48 01             	mov    %cl,0x1(%eax)
  1009e8:	89 d1                	mov    %edx,%ecx
  1009ea:	c1 e9 04             	shr    $0x4,%ecx
  1009ed:	0f b6 d9             	movzbl %cl,%ebx
  1009f0:	0f b6 48 02          	movzbl 0x2(%eax),%ecx
  1009f4:	83 e1 00             	and    $0x0,%ecx
  1009f7:	09 d9                	or     %ebx,%ecx
  1009f9:	88 48 02             	mov    %cl,0x2(%eax)
  1009fc:	c1 ea 0c             	shr    $0xc,%edx
  1009ff:	0f b6 ca             	movzbl %dl,%ecx
  100a02:	0f b6 50 03          	movzbl 0x3(%eax),%edx
  100a06:	83 e2 00             	and    $0x0,%edx
  100a09:	09 ca                	or     %ecx,%edx
  100a0b:	88 50 03             	mov    %dl,0x3(%eax)
  100a0e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100a12:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a19:	8b 45 08             	mov    0x8(%ebp),%eax
  100a1c:	01 d0                	add    %edx,%eax
  100a1e:	0f b6 10             	movzbl (%eax),%edx
  100a21:	83 ca 02             	or     $0x2,%edx
  100a24:	88 10                	mov    %dl,(%eax)
  100a26:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100a2a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a31:	8b 45 08             	mov    0x8(%ebp),%eax
  100a34:	01 d0                	add    %edx,%eax
  100a36:	0f b6 10             	movzbl (%eax),%edx
  100a39:	83 ca 01             	or     $0x1,%edx
  100a3c:	88 10                	mov    %dl,(%eax)
  100a3e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100a42:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a49:	8b 45 08             	mov    0x8(%ebp),%eax
  100a4c:	01 d0                	add    %edx,%eax
  100a4e:	0f b6 10             	movzbl (%eax),%edx
  100a51:	83 ca 04             	or     $0x4,%edx
  100a54:	88 10                	mov    %dl,(%eax)
  100a56:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100a5a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a61:	8b 45 08             	mov    0x8(%ebp),%eax
  100a64:	01 d0                	add    %edx,%eax
  100a66:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  100a6a:	c0 ea 04             	shr    $0x4,%dl
  100a6d:	0f b6 d2             	movzbl %dl,%edx
  100a70:	0f b6 48 02          	movzbl 0x2(%eax),%ecx
  100a74:	c1 e1 04             	shl    $0x4,%ecx
  100a77:	09 ca                	or     %ecx,%edx
  100a79:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  100a7d:	c1 e0 0c             	shl    $0xc,%eax
  100a80:	09 d0                	or     %edx,%eax
  100a82:	83 ec 04             	sub    $0x4,%esp
  100a85:	68 00 10 00 00       	push   $0x1000
  100a8a:	6a 00                	push   $0x0
  100a8c:	50                   	push   %eax
  100a8d:	e8 8a 15 00 00       	call   10201c <memset>
  100a92:	83 c4 10             	add    $0x10,%esp
  100a95:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100a99:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100aa0:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa3:	01 d0                	add    %edx,%eax
  100aa5:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  100aa9:	c0 ea 04             	shr    $0x4,%dl
  100aac:	0f b6 d2             	movzbl %dl,%edx
  100aaf:	0f b6 48 02          	movzbl 0x2(%eax),%ecx
  100ab3:	c1 e1 04             	shl    $0x4,%ecx
  100ab6:	09 ca                	or     %ecx,%edx
  100ab8:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  100abc:	c1 e0 0c             	shl    $0xc,%eax
  100abf:	09 d0                	or     %edx,%eax
  100ac1:	c1 e0 0c             	shl    $0xc,%eax
  100ac4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100ac7:	8b 45 0c             	mov    0xc(%ebp),%eax
  100aca:	c1 e8 0c             	shr    $0xc,%eax
  100acd:	25 ff 03 00 00       	and    $0x3ff,%eax
  100ad2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ad9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100adc:	01 d0                	add    %edx,%eax
  100ade:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ae1:	c9                   	leave
  100ae2:	c3                   	ret

00100ae3 <load_cr3>:
  100ae3:	55                   	push   %ebp
  100ae4:	89 e5                	mov    %esp,%ebp
  100ae6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae9:	0f 22 d8             	mov    %eax,%cr3
  100aec:	90                   	nop
  100aed:	5d                   	pop    %ebp
  100aee:	c3                   	ret

00100aef <vmm_setup_kpgdir>:
  100aef:	55                   	push   %ebp
  100af0:	89 e5                	mov    %esp,%ebp
  100af2:	83 ec 18             	sub    $0x18,%esp
  100af5:	e8 26 fc ff ff       	call   100720 <pmm_alloc>
  100afa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100afd:	83 ec 04             	sub    $0x4,%esp
  100b00:	68 00 10 00 00       	push   $0x1000
  100b05:	6a 00                	push   $0x0
  100b07:	ff 75 f4             	push   -0xc(%ebp)
  100b0a:	e8 0d 15 00 00       	call   10201c <memset>
  100b0f:	83 c4 10             	add    $0x10,%esp
  100b12:	83 ec 0c             	sub    $0xc,%esp
  100b15:	ff 75 f4             	push   -0xc(%ebp)
  100b18:	e8 0d fd ff ff       	call   10082a <vmm_map_kernel>
  100b1d:	83 c4 10             	add    $0x10,%esp
  100b20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b23:	c9                   	leave
  100b24:	c3                   	ret

00100b25 <print_pgdir>:
  100b25:	55                   	push   %ebp
  100b26:	89 e5                	mov    %esp,%ebp
  100b28:	53                   	push   %ebx
  100b29:	83 ec 14             	sub    $0x14,%esp
  100b2c:	83 ec 04             	sub    $0x4,%esp
  100b2f:	ff 75 08             	push   0x8(%ebp)
  100b32:	68 d3 24 10 00       	push   $0x1024d3
  100b37:	68 d8 1f 10 00       	push   $0x101fd8
  100b3c:	e8 12 16 00 00       	call   102153 <generic_printf>
  100b41:	83 c4 10             	add    $0x10,%esp
  100b44:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b4b:	e9 78 01 00 00       	jmp    100cc8 <print_pgdir+0x1a3>
  100b50:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b53:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b5a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5d:	01 d0                	add    %edx,%eax
  100b5f:	8b 00                	mov    (%eax),%eax
  100b61:	85 c0                	test   %eax,%eax
  100b63:	0f 84 5a 01 00 00    	je     100cc3 <print_pgdir+0x19e>
  100b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b6c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b73:	8b 45 08             	mov    0x8(%ebp),%eax
  100b76:	01 d0                	add    %edx,%eax
  100b78:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  100b7c:	c0 ea 04             	shr    $0x4,%dl
  100b7f:	0f b6 d2             	movzbl %dl,%edx
  100b82:	0f b6 48 02          	movzbl 0x2(%eax),%ecx
  100b86:	c1 e1 04             	shl    $0x4,%ecx
  100b89:	09 ca                	or     %ecx,%edx
  100b8b:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  100b8f:	c1 e0 0c             	shl    $0xc,%eax
  100b92:	09 d0                	or     %edx,%eax
  100b94:	50                   	push   %eax
  100b95:	ff 75 f4             	push   -0xc(%ebp)
  100b98:	68 db 24 10 00       	push   $0x1024db
  100b9d:	68 d8 1f 10 00       	push   $0x101fd8
  100ba2:	e8 ac 15 00 00       	call   102153 <generic_printf>
  100ba7:	83 c4 10             	add    $0x10,%esp
  100baa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bad:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bb4:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb7:	01 d0                	add    %edx,%eax
  100bb9:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  100bbd:	c0 ea 04             	shr    $0x4,%dl
  100bc0:	0f b6 d2             	movzbl %dl,%edx
  100bc3:	0f b6 48 02          	movzbl 0x2(%eax),%ecx
  100bc7:	c1 e1 04             	shl    $0x4,%ecx
  100bca:	09 ca                	or     %ecx,%edx
  100bcc:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  100bd0:	c1 e0 0c             	shl    $0xc,%eax
  100bd3:	09 d0                	or     %edx,%eax
  100bd5:	c1 e0 0c             	shl    $0xc,%eax
  100bd8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100bdb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  100be2:	e9 cd 00 00 00       	jmp    100cb4 <print_pgdir+0x18f>
  100be7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bea:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bf1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bf4:	01 d0                	add    %edx,%eax
  100bf6:	8b 00                	mov    (%eax),%eax
  100bf8:	85 c0                	test   %eax,%eax
  100bfa:	0f 84 af 00 00 00    	je     100caf <print_pgdir+0x18a>
  100c00:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c03:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100c0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c0d:	01 d0                	add    %edx,%eax
  100c0f:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  100c13:	c0 ea 04             	shr    $0x4,%dl
  100c16:	0f b6 d2             	movzbl %dl,%edx
  100c19:	0f b6 48 02          	movzbl 0x2(%eax),%ecx
  100c1d:	c1 e1 04             	shl    $0x4,%ecx
  100c20:	09 ca                	or     %ecx,%edx
  100c22:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  100c26:	c1 e0 0c             	shl    $0xc,%eax
  100c29:	09 d0                	or     %edx,%eax
  100c2b:	c1 e0 0c             	shl    $0xc,%eax
  100c2e:	50                   	push   %eax
  100c2f:	ff 75 f0             	push   -0x10(%ebp)
  100c32:	68 eb 24 10 00       	push   $0x1024eb
  100c37:	68 d8 1f 10 00       	push   $0x101fd8
  100c3c:	e8 12 15 00 00       	call   102153 <generic_printf>
  100c41:	83 c4 10             	add    $0x10,%esp
  100c44:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c47:	c1 e0 16             	shl    $0x16,%eax
  100c4a:	89 c2                	mov    %eax,%edx
  100c4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c4f:	c1 e0 0c             	shl    $0xc,%eax
  100c52:	89 d1                	mov    %edx,%ecx
  100c54:	09 c1                	or     %eax,%ecx
  100c56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c59:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100c60:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c63:	01 d0                	add    %edx,%eax
  100c65:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  100c69:	c0 ea 04             	shr    $0x4,%dl
  100c6c:	0f b6 d2             	movzbl %dl,%edx
  100c6f:	0f b6 58 02          	movzbl 0x2(%eax),%ebx
  100c73:	c1 e3 04             	shl    $0x4,%ebx
  100c76:	09 da                	or     %ebx,%edx
  100c78:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  100c7c:	c1 e0 0c             	shl    $0xc,%eax
  100c7f:	09 d0                	or     %edx,%eax
  100c81:	c1 e0 0c             	shl    $0xc,%eax
  100c84:	89 c2                	mov    %eax,%edx
  100c86:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c89:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
  100c90:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c93:	01 d8                	add    %ebx,%eax
  100c95:	83 ec 0c             	sub    $0xc,%esp
  100c98:	51                   	push   %ecx
  100c99:	52                   	push   %edx
  100c9a:	50                   	push   %eax
  100c9b:	68 00 25 10 00       	push   $0x102500
  100ca0:	68 d8 1f 10 00       	push   $0x101fd8
  100ca5:	e8 a9 14 00 00       	call   102153 <generic_printf>
  100caa:	83 c4 20             	add    $0x20,%esp
  100cad:	eb 01                	jmp    100cb0 <print_pgdir+0x18b>
  100caf:	90                   	nop
  100cb0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  100cb4:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
  100cbb:	0f 8e 26 ff ff ff    	jle    100be7 <print_pgdir+0xc2>
  100cc1:	eb 01                	jmp    100cc4 <print_pgdir+0x19f>
  100cc3:	90                   	nop
  100cc4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100cc8:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  100ccf:	0f 8e 7b fe ff ff    	jle    100b50 <print_pgdir+0x2b>
  100cd5:	90                   	nop
  100cd6:	90                   	nop
  100cd7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100cda:	c9                   	leave
  100cdb:	c3                   	ret

00100cdc <outb>:
  100cdc:	55                   	push   %ebp
  100cdd:	89 e5                	mov    %esp,%ebp
  100cdf:	83 ec 08             	sub    $0x8,%esp
  100ce2:	8b 55 08             	mov    0x8(%ebp),%edx
  100ce5:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ce8:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100cec:	88 45 f8             	mov    %al,-0x8(%ebp)
  100cef:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100cf3:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100cf7:	ee                   	out    %al,(%dx)
  100cf8:	90                   	nop
  100cf9:	c9                   	leave
  100cfa:	c3                   	ret

00100cfb <outw>:
  100cfb:	55                   	push   %ebp
  100cfc:	89 e5                	mov    %esp,%ebp
  100cfe:	83 ec 08             	sub    $0x8,%esp
  100d01:	8b 55 08             	mov    0x8(%ebp),%edx
  100d04:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d07:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100d0b:	88 45 f8             	mov    %al,-0x8(%ebp)
  100d0e:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100d12:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100d16:	ee                   	out    %al,(%dx)
  100d17:	90                   	nop
  100d18:	c9                   	leave
  100d19:	c3                   	ret

00100d1a <outstr>:
  100d1a:	55                   	push   %ebp
  100d1b:	89 e5                	mov    %esp,%ebp
  100d1d:	56                   	push   %esi
  100d1e:	53                   	push   %ebx
  100d1f:	83 ec 04             	sub    $0x4,%esp
  100d22:	8b 45 08             	mov    0x8(%ebp),%eax
  100d25:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  100d29:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100d2d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100d30:	8b 45 10             	mov    0x10(%ebp),%eax
  100d33:	89 cb                	mov    %ecx,%ebx
  100d35:	89 de                	mov    %ebx,%esi
  100d37:	89 c1                	mov    %eax,%ecx
  100d39:	fc                   	cld
  100d3a:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  100d3c:	89 c8                	mov    %ecx,%eax
  100d3e:	89 f3                	mov    %esi,%ebx
  100d40:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  100d43:	89 45 10             	mov    %eax,0x10(%ebp)
  100d46:	90                   	nop
  100d47:	83 c4 04             	add    $0x4,%esp
  100d4a:	5b                   	pop    %ebx
  100d4b:	5e                   	pop    %esi
  100d4c:	5d                   	pop    %ebp
  100d4d:	c3                   	ret

00100d4e <inb>:
  100d4e:	55                   	push   %ebp
  100d4f:	89 e5                	mov    %esp,%ebp
  100d51:	83 ec 14             	sub    $0x14,%esp
  100d54:	8b 45 08             	mov    0x8(%ebp),%eax
  100d57:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  100d5b:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100d5f:	89 c2                	mov    %eax,%edx
  100d61:	ec                   	in     (%dx),%al
  100d62:	88 45 ff             	mov    %al,-0x1(%ebp)
  100d65:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  100d69:	c9                   	leave
  100d6a:	c3                   	ret

00100d6b <instr>:
  100d6b:	55                   	push   %ebp
  100d6c:	89 e5                	mov    %esp,%ebp
  100d6e:	57                   	push   %edi
  100d6f:	53                   	push   %ebx
  100d70:	83 ec 04             	sub    $0x4,%esp
  100d73:	8b 45 08             	mov    0x8(%ebp),%eax
  100d76:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  100d7a:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100d7e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100d81:	8b 45 10             	mov    0x10(%ebp),%eax
  100d84:	89 cb                	mov    %ecx,%ebx
  100d86:	89 df                	mov    %ebx,%edi
  100d88:	89 c1                	mov    %eax,%ecx
  100d8a:	fc                   	cld
  100d8b:	f3 6d                	rep insl (%dx),%es:(%edi)
  100d8d:	89 c8                	mov    %ecx,%eax
  100d8f:	89 fb                	mov    %edi,%ebx
  100d91:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  100d94:	89 45 10             	mov    %eax,0x10(%ebp)
  100d97:	90                   	nop
  100d98:	83 c4 04             	add    $0x4,%esp
  100d9b:	5b                   	pop    %ebx
  100d9c:	5f                   	pop    %edi
  100d9d:	5d                   	pop    %ebp
  100d9e:	c3                   	ret

00100d9f <sti>:
  100d9f:	55                   	push   %ebp
  100da0:	89 e5                	mov    %esp,%ebp
  100da2:	fb                   	sti
  100da3:	90                   	nop
  100da4:	5d                   	pop    %ebp
  100da5:	c3                   	ret

00100da6 <cli>:
  100da6:	55                   	push   %ebp
  100da7:	89 e5                	mov    %esp,%ebp
  100da9:	fa                   	cli
  100daa:	90                   	nop
  100dab:	5d                   	pop    %ebp
  100dac:	c3                   	ret

00100dad <lgdt>:
  100dad:	55                   	push   %ebp
  100dae:	89 e5                	mov    %esp,%ebp
  100db0:	83 ec 14             	sub    $0x14,%esp
  100db3:	8b 45 0c             	mov    0xc(%ebp),%eax
  100db6:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  100dba:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100dbe:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  100dc2:	8b 45 08             	mov    0x8(%ebp),%eax
  100dc5:	0f b7 c8             	movzwl %ax,%ecx
  100dc8:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100dcc:	83 e2 00             	and    $0x0,%edx
  100dcf:	09 ca                	or     %ecx,%edx
  100dd1:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100dd5:	c1 e8 10             	shr    $0x10,%eax
  100dd8:	89 c2                	mov    %eax,%edx
  100dda:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dde:	83 e0 00             	and    $0x0,%eax
  100de1:	09 d0                	or     %edx,%eax
  100de3:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  100de7:	8d 45 fa             	lea    -0x6(%ebp),%eax
  100dea:	0f 01 10             	lgdtl  (%eax)
  100ded:	90                   	nop
  100dee:	c9                   	leave
  100def:	c3                   	ret

00100df0 <lidt>:
  100df0:	55                   	push   %ebp
  100df1:	89 e5                	mov    %esp,%ebp
  100df3:	83 ec 14             	sub    $0x14,%esp
  100df6:	8b 45 0c             	mov    0xc(%ebp),%eax
  100df9:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  100dfd:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100e01:	83 e8 01             	sub    $0x1,%eax
  100e04:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  100e08:	8b 45 08             	mov    0x8(%ebp),%eax
  100e0b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100e0e:	8d 45 fa             	lea    -0x6(%ebp),%eax
  100e11:	0f 01 18             	lidtl  (%eax)
  100e14:	90                   	nop
  100e15:	c9                   	leave
  100e16:	c3                   	ret

00100e17 <nop>:
  100e17:	55                   	push   %ebp
  100e18:	89 e5                	mov    %esp,%ebp
  100e1a:	90                   	nop
  100e1b:	90                   	nop
  100e1c:	5d                   	pop    %ebp
  100e1d:	c3                   	ret
  100e1e:	66 90                	xchg   %ax,%ax

00100e20 <flush_tss>:
  100e20:	60                   	pusha
  100e21:	66 b8 28 00          	mov    $0x28,%ax
  100e25:	0f 00 d8             	ltr    %ax
  100e28:	61                   	popa
  100e29:	c3                   	ret

00100e2a <idt_set_gate>:
  100e2a:	55                   	push   %ebp
  100e2b:	89 e5                	mov    %esp,%ebp
  100e2d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e30:	8b 45 0c             	mov    0xc(%ebp),%eax
  100e33:	8b 55 10             	mov    0x10(%ebp),%edx
  100e36:	89 04 cd c0 40 40 00 	mov    %eax,0x4040c0(,%ecx,8)
  100e3d:	89 14 cd c4 40 40 00 	mov    %edx,0x4040c4(,%ecx,8)
  100e44:	90                   	nop
  100e45:	5d                   	pop    %ebp
  100e46:	c3                   	ret

00100e47 <init_idt>:
  100e47:	55                   	push   %ebp
  100e48:	89 e5                	mov    %esp,%ebp
  100e4a:	83 ec 28             	sub    $0x28,%esp
  100e4d:	83 ec 04             	sub    $0x4,%esp
  100e50:	68 00 08 00 00       	push   $0x800
  100e55:	6a 00                	push   $0x0
  100e57:	68 c0 40 40 00       	push   $0x4040c0
  100e5c:	e8 bb 11 00 00       	call   10201c <memset>
  100e61:	83 c4 10             	add    $0x10,%esp
  100e64:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100e6b:	eb 7c                	jmp    100ee9 <init_idt+0xa2>
  100e6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e70:	8b 04 85 04 30 10 00 	mov    0x103004(,%eax,4),%eax
  100e77:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100e7a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  100e7d:	66 89 c2             	mov    %ax,%dx
  100e80:	89 d0                	mov    %edx,%eax
  100e82:	89 ca                	mov    %ecx,%edx
  100e84:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100e87:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  100e8a:	0f b7 c0             	movzwl %ax,%eax
  100e8d:	0d 00 00 08 00       	or     $0x80000,%eax
  100e92:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100e95:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100e98:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100e9b:	b2 00                	mov    $0x0,%dl
  100e9d:	89 d1                	mov    %edx,%ecx
  100e9f:	89 c2                	mov    %eax,%edx
  100ea1:	89 55 e0             	mov    %edx,-0x20(%ebp)
  100ea4:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  100ea7:	b8 8e ff ff ff       	mov    $0xffffff8e,%eax
  100eac:	88 c5                	mov    %al,%ch
  100eae:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  100eb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100eb4:	8b 04 85 04 30 10 00 	mov    0x103004(,%eax,4),%eax
  100ebb:	c1 e8 10             	shr    $0x10,%eax
  100ebe:	0f b7 c0             	movzwl %ax,%eax
  100ec1:	c1 e0 10             	shl    $0x10,%eax
  100ec4:	89 c2                	mov    %eax,%edx
  100ec6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100ec9:	0f b7 c0             	movzwl %ax,%eax
  100ecc:	09 d0                	or     %edx,%eax
  100ece:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100ed1:	83 ec 04             	sub    $0x4,%esp
  100ed4:	ff 75 e4             	push   -0x1c(%ebp)
  100ed7:	ff 75 e0             	push   -0x20(%ebp)
  100eda:	ff 75 f4             	push   -0xc(%ebp)
  100edd:	e8 48 ff ff ff       	call   100e2a <idt_set_gate>
  100ee2:	83 c4 10             	add    $0x10,%esp
  100ee5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100ee9:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
  100ef0:	0f 8e 77 ff ff ff    	jle    100e6d <init_idt+0x26>
  100ef6:	83 ec 08             	sub    $0x8,%esp
  100ef9:	68 00 08 00 00       	push   $0x800
  100efe:	68 c0 40 40 00       	push   $0x4040c0
  100f03:	e8 e8 fe ff ff       	call   100df0 <lidt>
  100f08:	83 c4 10             	add    $0x10,%esp
  100f0b:	90                   	nop
  100f0c:	c9                   	leave
  100f0d:	c3                   	ret

00100f0e <init_pic>:
  100f0e:	55                   	push   %ebp
  100f0f:	89 e5                	mov    %esp,%ebp
  100f11:	83 ec 28             	sub    $0x28,%esp
  100f14:	8b 55 08             	mov    0x8(%ebp),%edx
  100f17:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f1a:	88 55 e4             	mov    %dl,-0x1c(%ebp)
  100f1d:	88 45 e0             	mov    %al,-0x20(%ebp)
  100f20:	c6 45 f7 11          	movb   $0x11,-0x9(%ebp)
  100f24:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  100f28:	83 ec 08             	sub    $0x8,%esp
  100f2b:	50                   	push   %eax
  100f2c:	6a 20                	push   $0x20
  100f2e:	e8 a9 fd ff ff       	call   100cdc <outb>
  100f33:	83 c4 10             	add    $0x10,%esp
  100f36:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  100f3a:	83 ec 08             	sub    $0x8,%esp
  100f3d:	50                   	push   %eax
  100f3e:	68 a0 00 00 00       	push   $0xa0
  100f43:	e8 94 fd ff ff       	call   100cdc <outb>
  100f48:	83 c4 10             	add    $0x10,%esp
  100f4b:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  100f4f:	83 ec 08             	sub    $0x8,%esp
  100f52:	50                   	push   %eax
  100f53:	6a 21                	push   $0x21
  100f55:	e8 82 fd ff ff       	call   100cdc <outb>
  100f5a:	83 c4 10             	add    $0x10,%esp
  100f5d:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f61:	0f b6 c0             	movzbl %al,%eax
  100f64:	83 ec 08             	sub    $0x8,%esp
  100f67:	50                   	push   %eax
  100f68:	68 a1 00 00 00       	push   $0xa1
  100f6d:	e8 6a fd ff ff       	call   100cdc <outb>
  100f72:	83 c4 10             	add    $0x10,%esp
  100f75:	83 ec 08             	sub    $0x8,%esp
  100f78:	6a 04                	push   $0x4
  100f7a:	6a 21                	push   $0x21
  100f7c:	e8 5b fd ff ff       	call   100cdc <outb>
  100f81:	83 c4 10             	add    $0x10,%esp
  100f84:	83 ec 08             	sub    $0x8,%esp
  100f87:	6a 02                	push   $0x2
  100f89:	68 a1 00 00 00       	push   $0xa1
  100f8e:	e8 49 fd ff ff       	call   100cdc <outb>
  100f93:	83 c4 10             	add    $0x10,%esp
  100f96:	c6 45 f6 01          	movb   $0x1,-0xa(%ebp)
  100f9a:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  100f9e:	83 ec 08             	sub    $0x8,%esp
  100fa1:	50                   	push   %eax
  100fa2:	6a 21                	push   $0x21
  100fa4:	e8 33 fd ff ff       	call   100cdc <outb>
  100fa9:	83 c4 10             	add    $0x10,%esp
  100fac:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  100fb0:	83 ec 08             	sub    $0x8,%esp
  100fb3:	50                   	push   %eax
  100fb4:	68 a1 00 00 00       	push   $0xa1
  100fb9:	e8 1e fd ff ff       	call   100cdc <outb>
  100fbe:	83 c4 10             	add    $0x10,%esp
  100fc1:	83 ec 08             	sub    $0x8,%esp
  100fc4:	6a 00                	push   $0x0
  100fc6:	6a 21                	push   $0x21
  100fc8:	e8 0f fd ff ff       	call   100cdc <outb>
  100fcd:	83 c4 10             	add    $0x10,%esp
  100fd0:	83 ec 08             	sub    $0x8,%esp
  100fd3:	6a 00                	push   $0x0
  100fd5:	68 a1 00 00 00       	push   $0xa1
  100fda:	e8 fd fc ff ff       	call   100cdc <outb>
  100fdf:	83 c4 10             	add    $0x10,%esp
  100fe2:	90                   	nop
  100fe3:	c9                   	leave
  100fe4:	c3                   	ret

00100fe5 <init_interrupts>:
  100fe5:	55                   	push   %ebp
  100fe6:	89 e5                	mov    %esp,%ebp
  100fe8:	83 ec 08             	sub    $0x8,%esp
  100feb:	e8 b6 fd ff ff       	call   100da6 <cli>
  100ff0:	e8 52 fe ff ff       	call   100e47 <init_idt>
  100ff5:	83 ec 08             	sub    $0x8,%esp
  100ff8:	6a 28                	push   $0x28
  100ffa:	6a 20                	push   $0x20
  100ffc:	e8 0d ff ff ff       	call   100f0e <init_pic>
  101001:	83 c4 10             	add    $0x10,%esp
  101004:	e8 96 fd ff ff       	call   100d9f <sti>
  101009:	90                   	nop
  10100a:	c9                   	leave
  10100b:	c3                   	ret

0010100c <handle_interrupt>:
  10100c:	55                   	push   %ebp
  10100d:	89 e5                	mov    %esp,%ebp
  10100f:	83 ec 08             	sub    $0x8,%esp
  101012:	8b 45 08             	mov    0x8(%ebp),%eax
  101015:	8b 40 30             	mov    0x30(%eax),%eax
  101018:	83 f8 1f             	cmp    $0x1f,%eax
  10101b:	77 10                	ja     10102d <handle_interrupt+0x21>
  10101d:	83 ec 0c             	sub    $0xc,%esp
  101020:	ff 75 08             	push   0x8(%ebp)
  101023:	e8 40 00 00 00       	call   101068 <handle_fault>
  101028:	83 c4 10             	add    $0x10,%esp
  10102b:	eb 38                	jmp    101065 <handle_interrupt+0x59>
  10102d:	8b 45 08             	mov    0x8(%ebp),%eax
  101030:	8b 40 30             	mov    0x30(%eax),%eax
  101033:	83 f8 30             	cmp    $0x30,%eax
  101036:	77 10                	ja     101048 <handle_interrupt+0x3c>
  101038:	83 ec 0c             	sub    $0xc,%esp
  10103b:	ff 75 08             	push   0x8(%ebp)
  10103e:	e8 5a 01 00 00       	call   10119d <handle_irq>
  101043:	83 c4 10             	add    $0x10,%esp
  101046:	eb 1d                	jmp    101065 <handle_interrupt+0x59>
  101048:	a1 00 30 10 00       	mov    0x103000,%eax
  10104d:	8b 15 c0 48 40 00    	mov    0x4048c0,%edx
  101053:	01 d0                	add    %edx,%eax
  101055:	c6 00 55             	movb   $0x55,(%eax)
  101058:	a1 c0 48 40 00       	mov    0x4048c0,%eax
  10105d:	83 c0 02             	add    $0x2,%eax
  101060:	a3 c0 48 40 00       	mov    %eax,0x4048c0
  101065:	90                   	nop
  101066:	c9                   	leave
  101067:	c3                   	ret

00101068 <handle_fault>:
  101068:	55                   	push   %ebp
  101069:	89 e5                	mov    %esp,%ebp
  10106b:	53                   	push   %ebx
  10106c:	83 ec 14             	sub    $0x14,%esp
  10106f:	83 ec 08             	sub    $0x8,%esp
  101072:	68 1f 25 10 00       	push   $0x10251f
  101077:	68 d8 1f 10 00       	push   $0x101fd8
  10107c:	e8 d2 10 00 00       	call   102153 <generic_printf>
  101081:	83 c4 10             	add    $0x10,%esp
  101084:	8b 45 08             	mov    0x8(%ebp),%eax
  101087:	8b 40 30             	mov    0x30(%eax),%eax
  10108a:	83 ec 04             	sub    $0x4,%esp
  10108d:	50                   	push   %eax
  10108e:	68 34 25 10 00       	push   $0x102534
  101093:	68 d8 1f 10 00       	push   $0x101fd8
  101098:	e8 b6 10 00 00       	call   102153 <generic_printf>
  10109d:	83 c4 10             	add    $0x10,%esp
  1010a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a3:	8b 40 34             	mov    0x34(%eax),%eax
  1010a6:	83 ec 04             	sub    $0x4,%esp
  1010a9:	50                   	push   %eax
  1010aa:	68 47 25 10 00       	push   $0x102547
  1010af:	68 d8 1f 10 00       	push   $0x101fd8
  1010b4:	e8 9a 10 00 00       	call   102153 <generic_printf>
  1010b9:	83 c4 10             	add    $0x10,%esp
  1010bc:	0f 20 d0             	mov    %cr2,%eax
  1010bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1010c2:	0f 20 d8             	mov    %cr3,%eax
  1010c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1010c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1010cb:	8b 40 30             	mov    0x30(%eax),%eax
  1010ce:	83 f8 0e             	cmp    $0xe,%eax
  1010d1:	0f 85 a3 00 00 00    	jne    10117a <handle_fault+0x112>
  1010d7:	e8 32 0f 00 00       	call   10200e <disable_paging>
  1010dc:	83 ec 04             	sub    $0x4,%esp
  1010df:	ff 75 f4             	push   -0xc(%ebp)
  1010e2:	68 5b 25 10 00       	push   $0x10255b
  1010e7:	68 d8 1f 10 00       	push   $0x101fd8
  1010ec:	e8 62 10 00 00       	call   102153 <generic_printf>
  1010f1:	83 c4 10             	add    $0x10,%esp
  1010f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1010f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1010fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1010fd:	83 ec 04             	sub    $0x4,%esp
  101100:	6a 01                	push   $0x1
  101102:	50                   	push   %eax
  101103:	ff 75 ec             	push   -0x14(%ebp)
  101106:	e8 6c f8 ff ff       	call   100977 <vmm_walk>
  10110b:	83 c4 10             	add    $0x10,%esp
  10110e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101111:	e8 0a f6 ff ff       	call   100720 <pmm_alloc>
  101116:	c1 e8 0c             	shr    $0xc,%eax
  101119:	25 ff ff 0f 00       	and    $0xfffff,%eax
  10111e:	89 c2                	mov    %eax,%edx
  101120:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101123:	89 d1                	mov    %edx,%ecx
  101125:	83 e1 0f             	and    $0xf,%ecx
  101128:	89 cb                	mov    %ecx,%ebx
  10112a:	c1 e3 04             	shl    $0x4,%ebx
  10112d:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
  101131:	83 e1 0f             	and    $0xf,%ecx
  101134:	09 d9                	or     %ebx,%ecx
  101136:	88 48 01             	mov    %cl,0x1(%eax)
  101139:	89 d1                	mov    %edx,%ecx
  10113b:	c1 e9 04             	shr    $0x4,%ecx
  10113e:	0f b6 d9             	movzbl %cl,%ebx
  101141:	0f b6 48 02          	movzbl 0x2(%eax),%ecx
  101145:	83 e1 00             	and    $0x0,%ecx
  101148:	09 d9                	or     %ebx,%ecx
  10114a:	88 48 02             	mov    %cl,0x2(%eax)
  10114d:	c1 ea 0c             	shr    $0xc,%edx
  101150:	0f b6 ca             	movzbl %dl,%ecx
  101153:	0f b6 50 03          	movzbl 0x3(%eax),%edx
  101157:	83 e2 00             	and    $0x0,%edx
  10115a:	09 ca                	or     %ecx,%edx
  10115c:	88 50 03             	mov    %dl,0x3(%eax)
  10115f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101162:	0f b6 10             	movzbl (%eax),%edx
  101165:	83 ca 01             	or     $0x1,%edx
  101168:	88 10                	mov    %dl,(%eax)
  10116a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10116d:	0f b6 10             	movzbl (%eax),%edx
  101170:	83 ca 02             	or     $0x2,%edx
  101173:	88 10                	mov    %dl,(%eax)
  101175:	e8 86 0e 00 00       	call   102000 <enable_paging>
  10117a:	a1 00 30 10 00       	mov    0x103000,%eax
  10117f:	8b 15 c0 48 40 00    	mov    0x4048c0,%edx
  101185:	01 d0                	add    %edx,%eax
  101187:	c6 00 46             	movb   $0x46,(%eax)
  10118a:	a1 c0 48 40 00       	mov    0x4048c0,%eax
  10118f:	83 c0 02             	add    $0x2,%eax
  101192:	a3 c0 48 40 00       	mov    %eax,0x4048c0
  101197:	90                   	nop
  101198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10119b:	c9                   	leave
  10119c:	c3                   	ret

0010119d <handle_irq>:
  10119d:	55                   	push   %ebp
  10119e:	89 e5                	mov    %esp,%ebp
  1011a0:	a1 00 30 10 00       	mov    0x103000,%eax
  1011a5:	8b 15 c0 48 40 00    	mov    0x4048c0,%edx
  1011ab:	01 d0                	add    %edx,%eax
  1011ad:	c6 00 49             	movb   $0x49,(%eax)
  1011b0:	a1 c0 48 40 00       	mov    0x4048c0,%eax
  1011b5:	83 c0 02             	add    $0x2,%eax
  1011b8:	a3 c0 48 40 00       	mov    %eax,0x4048c0
  1011bd:	90                   	nop
  1011be:	5d                   	pop    %ebp
  1011bf:	c3                   	ret

001011c0 <isr_common>:
  1011c0:	60                   	pusha
  1011c1:	1e                   	push   %ds
  1011c2:	0f a0                	push   %fs
  1011c4:	06                   	push   %es
  1011c5:	0f a8                	push   %gs
  1011c7:	66 b8 10 00          	mov    $0x10,%ax
  1011cb:	8e d8                	mov    %eax,%ds
  1011cd:	8e c0                	mov    %eax,%es
  1011cf:	89 e3                	mov    %esp,%ebx
  1011d1:	53                   	push   %ebx
  1011d2:	e8 35 fe ff ff       	call   10100c <handle_interrupt>
  1011d7:	5b                   	pop    %ebx
  1011d8:	0f a9                	pop    %gs
  1011da:	07                   	pop    %es
  1011db:	0f a1                	pop    %fs
  1011dd:	1f                   	pop    %ds
  1011de:	61                   	popa
  1011df:	83 c4 08             	add    $0x8,%esp
  1011e2:	cf                   	iret

001011e3 <asm_isr_0>:
  1011e3:	fc                   	cld
  1011e4:	fa                   	cli
  1011e5:	6a 00                	push   $0x0
  1011e7:	6a 00                	push   $0x0
  1011e9:	eb d5                	jmp    1011c0 <isr_common>

001011eb <asm_isr_1>:
  1011eb:	fc                   	cld
  1011ec:	fa                   	cli
  1011ed:	6a 00                	push   $0x0
  1011ef:	6a 01                	push   $0x1
  1011f1:	eb cd                	jmp    1011c0 <isr_common>

001011f3 <asm_isr_2>:
  1011f3:	fc                   	cld
  1011f4:	fa                   	cli
  1011f5:	6a 00                	push   $0x0
  1011f7:	6a 02                	push   $0x2
  1011f9:	eb c5                	jmp    1011c0 <isr_common>

001011fb <asm_isr_3>:
  1011fb:	fc                   	cld
  1011fc:	fa                   	cli
  1011fd:	6a 00                	push   $0x0
  1011ff:	6a 03                	push   $0x3
  101201:	eb bd                	jmp    1011c0 <isr_common>

00101203 <asm_isr_4>:
  101203:	fc                   	cld
  101204:	fa                   	cli
  101205:	6a 00                	push   $0x0
  101207:	6a 04                	push   $0x4
  101209:	eb b5                	jmp    1011c0 <isr_common>

0010120b <asm_isr_5>:
  10120b:	fc                   	cld
  10120c:	fa                   	cli
  10120d:	6a 00                	push   $0x0
  10120f:	6a 05                	push   $0x5
  101211:	eb ad                	jmp    1011c0 <isr_common>

00101213 <asm_isr_6>:
  101213:	fc                   	cld
  101214:	fa                   	cli
  101215:	6a 00                	push   $0x0
  101217:	6a 06                	push   $0x6
  101219:	eb a5                	jmp    1011c0 <isr_common>

0010121b <asm_isr_7>:
  10121b:	fc                   	cld
  10121c:	fa                   	cli
  10121d:	6a 00                	push   $0x0
  10121f:	6a 07                	push   $0x7
  101221:	eb 9d                	jmp    1011c0 <isr_common>

00101223 <asm_isr_8>:
  101223:	fc                   	cld
  101224:	fa                   	cli
  101225:	6a 08                	push   $0x8
  101227:	eb 97                	jmp    1011c0 <isr_common>

00101229 <asm_isr_9>:
  101229:	fc                   	cld
  10122a:	fa                   	cli
  10122b:	6a 00                	push   $0x0
  10122d:	6a 09                	push   $0x9
  10122f:	eb 8f                	jmp    1011c0 <isr_common>

00101231 <asm_isr_10>:
  101231:	fc                   	cld
  101232:	fa                   	cli
  101233:	6a 0a                	push   $0xa
  101235:	eb 89                	jmp    1011c0 <isr_common>

00101237 <asm_isr_11>:
  101237:	fc                   	cld
  101238:	fa                   	cli
  101239:	6a 0b                	push   $0xb
  10123b:	eb 83                	jmp    1011c0 <isr_common>

0010123d <asm_isr_12>:
  10123d:	fc                   	cld
  10123e:	fa                   	cli
  10123f:	6a 0c                	push   $0xc
  101241:	e9 7a ff ff ff       	jmp    1011c0 <isr_common>

00101246 <asm_isr_13>:
  101246:	fc                   	cld
  101247:	fa                   	cli
  101248:	6a 0d                	push   $0xd
  10124a:	e9 71 ff ff ff       	jmp    1011c0 <isr_common>

0010124f <asm_isr_14>:
  10124f:	fc                   	cld
  101250:	fa                   	cli
  101251:	6a 0e                	push   $0xe
  101253:	e9 68 ff ff ff       	jmp    1011c0 <isr_common>

00101258 <asm_isr_15>:
  101258:	fc                   	cld
  101259:	fa                   	cli
  10125a:	6a 00                	push   $0x0
  10125c:	6a 0f                	push   $0xf
  10125e:	e9 5d ff ff ff       	jmp    1011c0 <isr_common>

00101263 <asm_isr_16>:
  101263:	fc                   	cld
  101264:	fa                   	cli
  101265:	6a 00                	push   $0x0
  101267:	6a 10                	push   $0x10
  101269:	e9 52 ff ff ff       	jmp    1011c0 <isr_common>

0010126e <asm_isr_17>:
  10126e:	fc                   	cld
  10126f:	fa                   	cli
  101270:	6a 00                	push   $0x0
  101272:	6a 11                	push   $0x11
  101274:	e9 47 ff ff ff       	jmp    1011c0 <isr_common>

00101279 <asm_isr_18>:
  101279:	fc                   	cld
  10127a:	fa                   	cli
  10127b:	6a 00                	push   $0x0
  10127d:	6a 12                	push   $0x12
  10127f:	e9 3c ff ff ff       	jmp    1011c0 <isr_common>

00101284 <asm_isr_19>:
  101284:	fc                   	cld
  101285:	fa                   	cli
  101286:	6a 00                	push   $0x0
  101288:	6a 13                	push   $0x13
  10128a:	e9 31 ff ff ff       	jmp    1011c0 <isr_common>

0010128f <asm_isr_20>:
  10128f:	fc                   	cld
  101290:	fa                   	cli
  101291:	6a 00                	push   $0x0
  101293:	6a 14                	push   $0x14
  101295:	e9 26 ff ff ff       	jmp    1011c0 <isr_common>

0010129a <asm_isr_21>:
  10129a:	fc                   	cld
  10129b:	fa                   	cli
  10129c:	6a 00                	push   $0x0
  10129e:	6a 15                	push   $0x15
  1012a0:	e9 1b ff ff ff       	jmp    1011c0 <isr_common>

001012a5 <asm_isr_22>:
  1012a5:	fc                   	cld
  1012a6:	fa                   	cli
  1012a7:	6a 00                	push   $0x0
  1012a9:	6a 16                	push   $0x16
  1012ab:	e9 10 ff ff ff       	jmp    1011c0 <isr_common>

001012b0 <asm_isr_23>:
  1012b0:	fc                   	cld
  1012b1:	fa                   	cli
  1012b2:	6a 00                	push   $0x0
  1012b4:	6a 17                	push   $0x17
  1012b6:	e9 05 ff ff ff       	jmp    1011c0 <isr_common>

001012bb <asm_isr_24>:
  1012bb:	fc                   	cld
  1012bc:	fa                   	cli
  1012bd:	6a 00                	push   $0x0
  1012bf:	6a 18                	push   $0x18
  1012c1:	e9 fa fe ff ff       	jmp    1011c0 <isr_common>

001012c6 <asm_isr_25>:
  1012c6:	fc                   	cld
  1012c7:	fa                   	cli
  1012c8:	6a 00                	push   $0x0
  1012ca:	6a 19                	push   $0x19
  1012cc:	e9 ef fe ff ff       	jmp    1011c0 <isr_common>

001012d1 <asm_isr_26>:
  1012d1:	fc                   	cld
  1012d2:	fa                   	cli
  1012d3:	6a 00                	push   $0x0
  1012d5:	6a 1a                	push   $0x1a
  1012d7:	e9 e4 fe ff ff       	jmp    1011c0 <isr_common>

001012dc <asm_isr_27>:
  1012dc:	fc                   	cld
  1012dd:	fa                   	cli
  1012de:	6a 00                	push   $0x0
  1012e0:	6a 1b                	push   $0x1b
  1012e2:	e9 d9 fe ff ff       	jmp    1011c0 <isr_common>

001012e7 <asm_isr_28>:
  1012e7:	fc                   	cld
  1012e8:	fa                   	cli
  1012e9:	6a 00                	push   $0x0
  1012eb:	6a 1c                	push   $0x1c
  1012ed:	e9 ce fe ff ff       	jmp    1011c0 <isr_common>

001012f2 <asm_isr_29>:
  1012f2:	fc                   	cld
  1012f3:	fa                   	cli
  1012f4:	6a 00                	push   $0x0
  1012f6:	6a 1d                	push   $0x1d
  1012f8:	e9 c3 fe ff ff       	jmp    1011c0 <isr_common>

001012fd <asm_isr_30>:
  1012fd:	fc                   	cld
  1012fe:	fa                   	cli
  1012ff:	6a 00                	push   $0x0
  101301:	6a 1e                	push   $0x1e
  101303:	e9 b8 fe ff ff       	jmp    1011c0 <isr_common>

00101308 <asm_isr_31>:
  101308:	fc                   	cld
  101309:	fa                   	cli
  10130a:	6a 00                	push   $0x0
  10130c:	6a 1f                	push   $0x1f
  10130e:	e9 ad fe ff ff       	jmp    1011c0 <isr_common>

00101313 <asm_isr_32>:
  101313:	fc                   	cld
  101314:	fa                   	cli
  101315:	6a 00                	push   $0x0
  101317:	6a 20                	push   $0x20
  101319:	e9 a2 fe ff ff       	jmp    1011c0 <isr_common>

0010131e <asm_isr_33>:
  10131e:	fc                   	cld
  10131f:	fa                   	cli
  101320:	6a 00                	push   $0x0
  101322:	6a 21                	push   $0x21
  101324:	e9 97 fe ff ff       	jmp    1011c0 <isr_common>

00101329 <asm_isr_34>:
  101329:	fc                   	cld
  10132a:	fa                   	cli
  10132b:	6a 00                	push   $0x0
  10132d:	6a 22                	push   $0x22
  10132f:	e9 8c fe ff ff       	jmp    1011c0 <isr_common>

00101334 <asm_isr_35>:
  101334:	fc                   	cld
  101335:	fa                   	cli
  101336:	6a 00                	push   $0x0
  101338:	6a 23                	push   $0x23
  10133a:	e9 81 fe ff ff       	jmp    1011c0 <isr_common>

0010133f <asm_isr_36>:
  10133f:	fc                   	cld
  101340:	fa                   	cli
  101341:	6a 00                	push   $0x0
  101343:	6a 24                	push   $0x24
  101345:	e9 76 fe ff ff       	jmp    1011c0 <isr_common>

0010134a <asm_isr_37>:
  10134a:	fc                   	cld
  10134b:	fa                   	cli
  10134c:	6a 00                	push   $0x0
  10134e:	6a 25                	push   $0x25
  101350:	e9 6b fe ff ff       	jmp    1011c0 <isr_common>

00101355 <asm_isr_38>:
  101355:	fc                   	cld
  101356:	fa                   	cli
  101357:	6a 00                	push   $0x0
  101359:	6a 26                	push   $0x26
  10135b:	e9 60 fe ff ff       	jmp    1011c0 <isr_common>

00101360 <asm_isr_39>:
  101360:	fc                   	cld
  101361:	fa                   	cli
  101362:	6a 00                	push   $0x0
  101364:	6a 27                	push   $0x27
  101366:	e9 55 fe ff ff       	jmp    1011c0 <isr_common>

0010136b <asm_isr_40>:
  10136b:	fc                   	cld
  10136c:	fa                   	cli
  10136d:	6a 00                	push   $0x0
  10136f:	6a 28                	push   $0x28
  101371:	e9 4a fe ff ff       	jmp    1011c0 <isr_common>

00101376 <asm_isr_41>:
  101376:	fc                   	cld
  101377:	fa                   	cli
  101378:	6a 00                	push   $0x0
  10137a:	6a 29                	push   $0x29
  10137c:	e9 3f fe ff ff       	jmp    1011c0 <isr_common>

00101381 <asm_isr_42>:
  101381:	fc                   	cld
  101382:	fa                   	cli
  101383:	6a 00                	push   $0x0
  101385:	6a 2a                	push   $0x2a
  101387:	e9 34 fe ff ff       	jmp    1011c0 <isr_common>

0010138c <asm_isr_43>:
  10138c:	fc                   	cld
  10138d:	fa                   	cli
  10138e:	6a 00                	push   $0x0
  101390:	6a 2b                	push   $0x2b
  101392:	e9 29 fe ff ff       	jmp    1011c0 <isr_common>

00101397 <asm_isr_44>:
  101397:	fc                   	cld
  101398:	fa                   	cli
  101399:	6a 00                	push   $0x0
  10139b:	6a 2c                	push   $0x2c
  10139d:	e9 1e fe ff ff       	jmp    1011c0 <isr_common>

001013a2 <asm_isr_45>:
  1013a2:	fc                   	cld
  1013a3:	fa                   	cli
  1013a4:	6a 00                	push   $0x0
  1013a6:	6a 2d                	push   $0x2d
  1013a8:	e9 13 fe ff ff       	jmp    1011c0 <isr_common>

001013ad <asm_isr_46>:
  1013ad:	fc                   	cld
  1013ae:	fa                   	cli
  1013af:	6a 00                	push   $0x0
  1013b1:	6a 2e                	push   $0x2e
  1013b3:	e9 08 fe ff ff       	jmp    1011c0 <isr_common>

001013b8 <asm_isr_47>:
  1013b8:	fc                   	cld
  1013b9:	fa                   	cli
  1013ba:	6a 00                	push   $0x0
  1013bc:	6a 2f                	push   $0x2f
  1013be:	e9 fd fd ff ff       	jmp    1011c0 <isr_common>

001013c3 <asm_isr_48>:
  1013c3:	fc                   	cld
  1013c4:	fa                   	cli
  1013c5:	6a 00                	push   $0x0
  1013c7:	6a 30                	push   $0x30
  1013c9:	e9 f2 fd ff ff       	jmp    1011c0 <isr_common>

001013ce <asm_isr_49>:
  1013ce:	fc                   	cld
  1013cf:	fa                   	cli
  1013d0:	6a 00                	push   $0x0
  1013d2:	6a 31                	push   $0x31
  1013d4:	e9 e7 fd ff ff       	jmp    1011c0 <isr_common>

001013d9 <asm_isr_50>:
  1013d9:	fc                   	cld
  1013da:	fa                   	cli
  1013db:	6a 00                	push   $0x0
  1013dd:	6a 32                	push   $0x32
  1013df:	e9 dc fd ff ff       	jmp    1011c0 <isr_common>

001013e4 <asm_isr_51>:
  1013e4:	fc                   	cld
  1013e5:	fa                   	cli
  1013e6:	6a 00                	push   $0x0
  1013e8:	6a 33                	push   $0x33
  1013ea:	e9 d1 fd ff ff       	jmp    1011c0 <isr_common>

001013ef <asm_isr_52>:
  1013ef:	fc                   	cld
  1013f0:	fa                   	cli
  1013f1:	6a 00                	push   $0x0
  1013f3:	6a 34                	push   $0x34
  1013f5:	e9 c6 fd ff ff       	jmp    1011c0 <isr_common>

001013fa <asm_isr_53>:
  1013fa:	fc                   	cld
  1013fb:	fa                   	cli
  1013fc:	6a 00                	push   $0x0
  1013fe:	6a 35                	push   $0x35
  101400:	e9 bb fd ff ff       	jmp    1011c0 <isr_common>

00101405 <asm_isr_54>:
  101405:	fc                   	cld
  101406:	fa                   	cli
  101407:	6a 00                	push   $0x0
  101409:	6a 36                	push   $0x36
  10140b:	e9 b0 fd ff ff       	jmp    1011c0 <isr_common>

00101410 <asm_isr_55>:
  101410:	fc                   	cld
  101411:	fa                   	cli
  101412:	6a 00                	push   $0x0
  101414:	6a 37                	push   $0x37
  101416:	e9 a5 fd ff ff       	jmp    1011c0 <isr_common>

0010141b <asm_isr_56>:
  10141b:	fc                   	cld
  10141c:	fa                   	cli
  10141d:	6a 00                	push   $0x0
  10141f:	6a 38                	push   $0x38
  101421:	e9 9a fd ff ff       	jmp    1011c0 <isr_common>

00101426 <asm_isr_57>:
  101426:	fc                   	cld
  101427:	fa                   	cli
  101428:	6a 00                	push   $0x0
  10142a:	6a 39                	push   $0x39
  10142c:	e9 8f fd ff ff       	jmp    1011c0 <isr_common>

00101431 <asm_isr_58>:
  101431:	fc                   	cld
  101432:	fa                   	cli
  101433:	6a 00                	push   $0x0
  101435:	6a 3a                	push   $0x3a
  101437:	e9 84 fd ff ff       	jmp    1011c0 <isr_common>

0010143c <asm_isr_59>:
  10143c:	fc                   	cld
  10143d:	fa                   	cli
  10143e:	6a 00                	push   $0x0
  101440:	6a 3b                	push   $0x3b
  101442:	e9 79 fd ff ff       	jmp    1011c0 <isr_common>

00101447 <asm_isr_60>:
  101447:	fc                   	cld
  101448:	fa                   	cli
  101449:	6a 00                	push   $0x0
  10144b:	6a 3c                	push   $0x3c
  10144d:	e9 6e fd ff ff       	jmp    1011c0 <isr_common>

00101452 <asm_isr_61>:
  101452:	fc                   	cld
  101453:	fa                   	cli
  101454:	6a 00                	push   $0x0
  101456:	6a 3d                	push   $0x3d
  101458:	e9 63 fd ff ff       	jmp    1011c0 <isr_common>

0010145d <asm_isr_62>:
  10145d:	fc                   	cld
  10145e:	fa                   	cli
  10145f:	6a 00                	push   $0x0
  101461:	6a 3e                	push   $0x3e
  101463:	e9 58 fd ff ff       	jmp    1011c0 <isr_common>

00101468 <asm_isr_63>:
  101468:	fc                   	cld
  101469:	fa                   	cli
  10146a:	6a 00                	push   $0x0
  10146c:	6a 3f                	push   $0x3f
  10146e:	e9 4d fd ff ff       	jmp    1011c0 <isr_common>

00101473 <asm_isr_64>:
  101473:	fc                   	cld
  101474:	fa                   	cli
  101475:	6a 00                	push   $0x0
  101477:	6a 40                	push   $0x40
  101479:	e9 42 fd ff ff       	jmp    1011c0 <isr_common>

0010147e <asm_isr_65>:
  10147e:	fc                   	cld
  10147f:	fa                   	cli
  101480:	6a 00                	push   $0x0
  101482:	6a 41                	push   $0x41
  101484:	e9 37 fd ff ff       	jmp    1011c0 <isr_common>

00101489 <asm_isr_66>:
  101489:	fc                   	cld
  10148a:	fa                   	cli
  10148b:	6a 00                	push   $0x0
  10148d:	6a 42                	push   $0x42
  10148f:	e9 2c fd ff ff       	jmp    1011c0 <isr_common>

00101494 <asm_isr_67>:
  101494:	fc                   	cld
  101495:	fa                   	cli
  101496:	6a 00                	push   $0x0
  101498:	6a 43                	push   $0x43
  10149a:	e9 21 fd ff ff       	jmp    1011c0 <isr_common>

0010149f <asm_isr_68>:
  10149f:	fc                   	cld
  1014a0:	fa                   	cli
  1014a1:	6a 00                	push   $0x0
  1014a3:	6a 44                	push   $0x44
  1014a5:	e9 16 fd ff ff       	jmp    1011c0 <isr_common>

001014aa <asm_isr_69>:
  1014aa:	fc                   	cld
  1014ab:	fa                   	cli
  1014ac:	6a 00                	push   $0x0
  1014ae:	6a 45                	push   $0x45
  1014b0:	e9 0b fd ff ff       	jmp    1011c0 <isr_common>

001014b5 <asm_isr_70>:
  1014b5:	fc                   	cld
  1014b6:	fa                   	cli
  1014b7:	6a 00                	push   $0x0
  1014b9:	6a 46                	push   $0x46
  1014bb:	e9 00 fd ff ff       	jmp    1011c0 <isr_common>

001014c0 <asm_isr_71>:
  1014c0:	fc                   	cld
  1014c1:	fa                   	cli
  1014c2:	6a 00                	push   $0x0
  1014c4:	6a 47                	push   $0x47
  1014c6:	e9 f5 fc ff ff       	jmp    1011c0 <isr_common>

001014cb <asm_isr_72>:
  1014cb:	fc                   	cld
  1014cc:	fa                   	cli
  1014cd:	6a 00                	push   $0x0
  1014cf:	6a 48                	push   $0x48
  1014d1:	e9 ea fc ff ff       	jmp    1011c0 <isr_common>

001014d6 <asm_isr_73>:
  1014d6:	fc                   	cld
  1014d7:	fa                   	cli
  1014d8:	6a 00                	push   $0x0
  1014da:	6a 49                	push   $0x49
  1014dc:	e9 df fc ff ff       	jmp    1011c0 <isr_common>

001014e1 <asm_isr_74>:
  1014e1:	fc                   	cld
  1014e2:	fa                   	cli
  1014e3:	6a 00                	push   $0x0
  1014e5:	6a 4a                	push   $0x4a
  1014e7:	e9 d4 fc ff ff       	jmp    1011c0 <isr_common>

001014ec <asm_isr_75>:
  1014ec:	fc                   	cld
  1014ed:	fa                   	cli
  1014ee:	6a 00                	push   $0x0
  1014f0:	6a 4b                	push   $0x4b
  1014f2:	e9 c9 fc ff ff       	jmp    1011c0 <isr_common>

001014f7 <asm_isr_76>:
  1014f7:	fc                   	cld
  1014f8:	fa                   	cli
  1014f9:	6a 00                	push   $0x0
  1014fb:	6a 4c                	push   $0x4c
  1014fd:	e9 be fc ff ff       	jmp    1011c0 <isr_common>

00101502 <asm_isr_77>:
  101502:	fc                   	cld
  101503:	fa                   	cli
  101504:	6a 00                	push   $0x0
  101506:	6a 4d                	push   $0x4d
  101508:	e9 b3 fc ff ff       	jmp    1011c0 <isr_common>

0010150d <asm_isr_78>:
  10150d:	fc                   	cld
  10150e:	fa                   	cli
  10150f:	6a 00                	push   $0x0
  101511:	6a 4e                	push   $0x4e
  101513:	e9 a8 fc ff ff       	jmp    1011c0 <isr_common>

00101518 <asm_isr_79>:
  101518:	fc                   	cld
  101519:	fa                   	cli
  10151a:	6a 00                	push   $0x0
  10151c:	6a 4f                	push   $0x4f
  10151e:	e9 9d fc ff ff       	jmp    1011c0 <isr_common>

00101523 <asm_isr_80>:
  101523:	fc                   	cld
  101524:	fa                   	cli
  101525:	6a 00                	push   $0x0
  101527:	6a 50                	push   $0x50
  101529:	e9 92 fc ff ff       	jmp    1011c0 <isr_common>

0010152e <asm_isr_81>:
  10152e:	fc                   	cld
  10152f:	fa                   	cli
  101530:	6a 00                	push   $0x0
  101532:	6a 51                	push   $0x51
  101534:	e9 87 fc ff ff       	jmp    1011c0 <isr_common>

00101539 <asm_isr_82>:
  101539:	fc                   	cld
  10153a:	fa                   	cli
  10153b:	6a 00                	push   $0x0
  10153d:	6a 52                	push   $0x52
  10153f:	e9 7c fc ff ff       	jmp    1011c0 <isr_common>

00101544 <asm_isr_83>:
  101544:	fc                   	cld
  101545:	fa                   	cli
  101546:	6a 00                	push   $0x0
  101548:	6a 53                	push   $0x53
  10154a:	e9 71 fc ff ff       	jmp    1011c0 <isr_common>

0010154f <asm_isr_84>:
  10154f:	fc                   	cld
  101550:	fa                   	cli
  101551:	6a 00                	push   $0x0
  101553:	6a 54                	push   $0x54
  101555:	e9 66 fc ff ff       	jmp    1011c0 <isr_common>

0010155a <asm_isr_85>:
  10155a:	fc                   	cld
  10155b:	fa                   	cli
  10155c:	6a 00                	push   $0x0
  10155e:	6a 55                	push   $0x55
  101560:	e9 5b fc ff ff       	jmp    1011c0 <isr_common>

00101565 <asm_isr_86>:
  101565:	fc                   	cld
  101566:	fa                   	cli
  101567:	6a 00                	push   $0x0
  101569:	6a 56                	push   $0x56
  10156b:	e9 50 fc ff ff       	jmp    1011c0 <isr_common>

00101570 <asm_isr_87>:
  101570:	fc                   	cld
  101571:	fa                   	cli
  101572:	6a 00                	push   $0x0
  101574:	6a 57                	push   $0x57
  101576:	e9 45 fc ff ff       	jmp    1011c0 <isr_common>

0010157b <asm_isr_88>:
  10157b:	fc                   	cld
  10157c:	fa                   	cli
  10157d:	6a 00                	push   $0x0
  10157f:	6a 58                	push   $0x58
  101581:	e9 3a fc ff ff       	jmp    1011c0 <isr_common>

00101586 <asm_isr_89>:
  101586:	fc                   	cld
  101587:	fa                   	cli
  101588:	6a 00                	push   $0x0
  10158a:	6a 59                	push   $0x59
  10158c:	e9 2f fc ff ff       	jmp    1011c0 <isr_common>

00101591 <asm_isr_90>:
  101591:	fc                   	cld
  101592:	fa                   	cli
  101593:	6a 00                	push   $0x0
  101595:	6a 5a                	push   $0x5a
  101597:	e9 24 fc ff ff       	jmp    1011c0 <isr_common>

0010159c <asm_isr_91>:
  10159c:	fc                   	cld
  10159d:	fa                   	cli
  10159e:	6a 00                	push   $0x0
  1015a0:	6a 5b                	push   $0x5b
  1015a2:	e9 19 fc ff ff       	jmp    1011c0 <isr_common>

001015a7 <asm_isr_92>:
  1015a7:	fc                   	cld
  1015a8:	fa                   	cli
  1015a9:	6a 00                	push   $0x0
  1015ab:	6a 5c                	push   $0x5c
  1015ad:	e9 0e fc ff ff       	jmp    1011c0 <isr_common>

001015b2 <asm_isr_93>:
  1015b2:	fc                   	cld
  1015b3:	fa                   	cli
  1015b4:	6a 00                	push   $0x0
  1015b6:	6a 5d                	push   $0x5d
  1015b8:	e9 03 fc ff ff       	jmp    1011c0 <isr_common>

001015bd <asm_isr_94>:
  1015bd:	fc                   	cld
  1015be:	fa                   	cli
  1015bf:	6a 00                	push   $0x0
  1015c1:	6a 5e                	push   $0x5e
  1015c3:	e9 f8 fb ff ff       	jmp    1011c0 <isr_common>

001015c8 <asm_isr_95>:
  1015c8:	fc                   	cld
  1015c9:	fa                   	cli
  1015ca:	6a 00                	push   $0x0
  1015cc:	6a 5f                	push   $0x5f
  1015ce:	e9 ed fb ff ff       	jmp    1011c0 <isr_common>

001015d3 <asm_isr_96>:
  1015d3:	fc                   	cld
  1015d4:	fa                   	cli
  1015d5:	6a 00                	push   $0x0
  1015d7:	6a 60                	push   $0x60
  1015d9:	e9 e2 fb ff ff       	jmp    1011c0 <isr_common>

001015de <asm_isr_97>:
  1015de:	fc                   	cld
  1015df:	fa                   	cli
  1015e0:	6a 00                	push   $0x0
  1015e2:	6a 61                	push   $0x61
  1015e4:	e9 d7 fb ff ff       	jmp    1011c0 <isr_common>

001015e9 <asm_isr_98>:
  1015e9:	fc                   	cld
  1015ea:	fa                   	cli
  1015eb:	6a 00                	push   $0x0
  1015ed:	6a 62                	push   $0x62
  1015ef:	e9 cc fb ff ff       	jmp    1011c0 <isr_common>

001015f4 <asm_isr_99>:
  1015f4:	fc                   	cld
  1015f5:	fa                   	cli
  1015f6:	6a 00                	push   $0x0
  1015f8:	6a 63                	push   $0x63
  1015fa:	e9 c1 fb ff ff       	jmp    1011c0 <isr_common>

001015ff <asm_isr_100>:
  1015ff:	fc                   	cld
  101600:	fa                   	cli
  101601:	6a 00                	push   $0x0
  101603:	6a 64                	push   $0x64
  101605:	e9 b6 fb ff ff       	jmp    1011c0 <isr_common>

0010160a <asm_isr_101>:
  10160a:	fc                   	cld
  10160b:	fa                   	cli
  10160c:	6a 00                	push   $0x0
  10160e:	6a 65                	push   $0x65
  101610:	e9 ab fb ff ff       	jmp    1011c0 <isr_common>

00101615 <asm_isr_102>:
  101615:	fc                   	cld
  101616:	fa                   	cli
  101617:	6a 00                	push   $0x0
  101619:	6a 66                	push   $0x66
  10161b:	e9 a0 fb ff ff       	jmp    1011c0 <isr_common>

00101620 <asm_isr_103>:
  101620:	fc                   	cld
  101621:	fa                   	cli
  101622:	6a 00                	push   $0x0
  101624:	6a 67                	push   $0x67
  101626:	e9 95 fb ff ff       	jmp    1011c0 <isr_common>

0010162b <asm_isr_104>:
  10162b:	fc                   	cld
  10162c:	fa                   	cli
  10162d:	6a 00                	push   $0x0
  10162f:	6a 68                	push   $0x68
  101631:	e9 8a fb ff ff       	jmp    1011c0 <isr_common>

00101636 <asm_isr_105>:
  101636:	fc                   	cld
  101637:	fa                   	cli
  101638:	6a 00                	push   $0x0
  10163a:	6a 69                	push   $0x69
  10163c:	e9 7f fb ff ff       	jmp    1011c0 <isr_common>

00101641 <asm_isr_106>:
  101641:	fc                   	cld
  101642:	fa                   	cli
  101643:	6a 00                	push   $0x0
  101645:	6a 6a                	push   $0x6a
  101647:	e9 74 fb ff ff       	jmp    1011c0 <isr_common>

0010164c <asm_isr_107>:
  10164c:	fc                   	cld
  10164d:	fa                   	cli
  10164e:	6a 00                	push   $0x0
  101650:	6a 6b                	push   $0x6b
  101652:	e9 69 fb ff ff       	jmp    1011c0 <isr_common>

00101657 <asm_isr_108>:
  101657:	fc                   	cld
  101658:	fa                   	cli
  101659:	6a 00                	push   $0x0
  10165b:	6a 6c                	push   $0x6c
  10165d:	e9 5e fb ff ff       	jmp    1011c0 <isr_common>

00101662 <asm_isr_109>:
  101662:	fc                   	cld
  101663:	fa                   	cli
  101664:	6a 00                	push   $0x0
  101666:	6a 6d                	push   $0x6d
  101668:	e9 53 fb ff ff       	jmp    1011c0 <isr_common>

0010166d <asm_isr_110>:
  10166d:	fc                   	cld
  10166e:	fa                   	cli
  10166f:	6a 00                	push   $0x0
  101671:	6a 6e                	push   $0x6e
  101673:	e9 48 fb ff ff       	jmp    1011c0 <isr_common>

00101678 <asm_isr_111>:
  101678:	fc                   	cld
  101679:	fa                   	cli
  10167a:	6a 00                	push   $0x0
  10167c:	6a 6f                	push   $0x6f
  10167e:	e9 3d fb ff ff       	jmp    1011c0 <isr_common>

00101683 <asm_isr_112>:
  101683:	fc                   	cld
  101684:	fa                   	cli
  101685:	6a 00                	push   $0x0
  101687:	6a 70                	push   $0x70
  101689:	e9 32 fb ff ff       	jmp    1011c0 <isr_common>

0010168e <asm_isr_113>:
  10168e:	fc                   	cld
  10168f:	fa                   	cli
  101690:	6a 00                	push   $0x0
  101692:	6a 71                	push   $0x71
  101694:	e9 27 fb ff ff       	jmp    1011c0 <isr_common>

00101699 <asm_isr_114>:
  101699:	fc                   	cld
  10169a:	fa                   	cli
  10169b:	6a 00                	push   $0x0
  10169d:	6a 72                	push   $0x72
  10169f:	e9 1c fb ff ff       	jmp    1011c0 <isr_common>

001016a4 <asm_isr_115>:
  1016a4:	fc                   	cld
  1016a5:	fa                   	cli
  1016a6:	6a 00                	push   $0x0
  1016a8:	6a 73                	push   $0x73
  1016aa:	e9 11 fb ff ff       	jmp    1011c0 <isr_common>

001016af <asm_isr_116>:
  1016af:	fc                   	cld
  1016b0:	fa                   	cli
  1016b1:	6a 00                	push   $0x0
  1016b3:	6a 74                	push   $0x74
  1016b5:	e9 06 fb ff ff       	jmp    1011c0 <isr_common>

001016ba <asm_isr_117>:
  1016ba:	fc                   	cld
  1016bb:	fa                   	cli
  1016bc:	6a 00                	push   $0x0
  1016be:	6a 75                	push   $0x75
  1016c0:	e9 fb fa ff ff       	jmp    1011c0 <isr_common>

001016c5 <asm_isr_118>:
  1016c5:	fc                   	cld
  1016c6:	fa                   	cli
  1016c7:	6a 00                	push   $0x0
  1016c9:	6a 76                	push   $0x76
  1016cb:	e9 f0 fa ff ff       	jmp    1011c0 <isr_common>

001016d0 <asm_isr_119>:
  1016d0:	fc                   	cld
  1016d1:	fa                   	cli
  1016d2:	6a 00                	push   $0x0
  1016d4:	6a 77                	push   $0x77
  1016d6:	e9 e5 fa ff ff       	jmp    1011c0 <isr_common>

001016db <asm_isr_120>:
  1016db:	fc                   	cld
  1016dc:	fa                   	cli
  1016dd:	6a 00                	push   $0x0
  1016df:	6a 78                	push   $0x78
  1016e1:	e9 da fa ff ff       	jmp    1011c0 <isr_common>

001016e6 <asm_isr_121>:
  1016e6:	fc                   	cld
  1016e7:	fa                   	cli
  1016e8:	6a 00                	push   $0x0
  1016ea:	6a 79                	push   $0x79
  1016ec:	e9 cf fa ff ff       	jmp    1011c0 <isr_common>

001016f1 <asm_isr_122>:
  1016f1:	fc                   	cld
  1016f2:	fa                   	cli
  1016f3:	6a 00                	push   $0x0
  1016f5:	6a 7a                	push   $0x7a
  1016f7:	e9 c4 fa ff ff       	jmp    1011c0 <isr_common>

001016fc <asm_isr_123>:
  1016fc:	fc                   	cld
  1016fd:	fa                   	cli
  1016fe:	6a 00                	push   $0x0
  101700:	6a 7b                	push   $0x7b
  101702:	e9 b9 fa ff ff       	jmp    1011c0 <isr_common>

00101707 <asm_isr_124>:
  101707:	fc                   	cld
  101708:	fa                   	cli
  101709:	6a 00                	push   $0x0
  10170b:	6a 7c                	push   $0x7c
  10170d:	e9 ae fa ff ff       	jmp    1011c0 <isr_common>

00101712 <asm_isr_125>:
  101712:	fc                   	cld
  101713:	fa                   	cli
  101714:	6a 00                	push   $0x0
  101716:	6a 7d                	push   $0x7d
  101718:	e9 a3 fa ff ff       	jmp    1011c0 <isr_common>

0010171d <asm_isr_126>:
  10171d:	fc                   	cld
  10171e:	fa                   	cli
  10171f:	6a 00                	push   $0x0
  101721:	6a 7e                	push   $0x7e
  101723:	e9 98 fa ff ff       	jmp    1011c0 <isr_common>

00101728 <asm_isr_127>:
  101728:	fc                   	cld
  101729:	fa                   	cli
  10172a:	6a 00                	push   $0x0
  10172c:	6a 7f                	push   $0x7f
  10172e:	e9 8d fa ff ff       	jmp    1011c0 <isr_common>

00101733 <asm_isr_128>:
  101733:	fc                   	cld
  101734:	fa                   	cli
  101735:	6a 00                	push   $0x0
  101737:	68 80 00 00 00       	push   $0x80
  10173c:	e9 7f fa ff ff       	jmp    1011c0 <isr_common>

00101741 <asm_isr_129>:
  101741:	fc                   	cld
  101742:	fa                   	cli
  101743:	6a 00                	push   $0x0
  101745:	68 81 00 00 00       	push   $0x81
  10174a:	e9 71 fa ff ff       	jmp    1011c0 <isr_common>

0010174f <asm_isr_130>:
  10174f:	fc                   	cld
  101750:	fa                   	cli
  101751:	6a 00                	push   $0x0
  101753:	68 82 00 00 00       	push   $0x82
  101758:	e9 63 fa ff ff       	jmp    1011c0 <isr_common>

0010175d <asm_isr_131>:
  10175d:	fc                   	cld
  10175e:	fa                   	cli
  10175f:	6a 00                	push   $0x0
  101761:	68 83 00 00 00       	push   $0x83
  101766:	e9 55 fa ff ff       	jmp    1011c0 <isr_common>

0010176b <asm_isr_132>:
  10176b:	fc                   	cld
  10176c:	fa                   	cli
  10176d:	6a 00                	push   $0x0
  10176f:	68 84 00 00 00       	push   $0x84
  101774:	e9 47 fa ff ff       	jmp    1011c0 <isr_common>

00101779 <asm_isr_133>:
  101779:	fc                   	cld
  10177a:	fa                   	cli
  10177b:	6a 00                	push   $0x0
  10177d:	68 85 00 00 00       	push   $0x85
  101782:	e9 39 fa ff ff       	jmp    1011c0 <isr_common>

00101787 <asm_isr_134>:
  101787:	fc                   	cld
  101788:	fa                   	cli
  101789:	6a 00                	push   $0x0
  10178b:	68 86 00 00 00       	push   $0x86
  101790:	e9 2b fa ff ff       	jmp    1011c0 <isr_common>

00101795 <asm_isr_135>:
  101795:	fc                   	cld
  101796:	fa                   	cli
  101797:	6a 00                	push   $0x0
  101799:	68 87 00 00 00       	push   $0x87
  10179e:	e9 1d fa ff ff       	jmp    1011c0 <isr_common>

001017a3 <asm_isr_136>:
  1017a3:	fc                   	cld
  1017a4:	fa                   	cli
  1017a5:	6a 00                	push   $0x0
  1017a7:	68 88 00 00 00       	push   $0x88
  1017ac:	e9 0f fa ff ff       	jmp    1011c0 <isr_common>

001017b1 <asm_isr_137>:
  1017b1:	fc                   	cld
  1017b2:	fa                   	cli
  1017b3:	6a 00                	push   $0x0
  1017b5:	68 89 00 00 00       	push   $0x89
  1017ba:	e9 01 fa ff ff       	jmp    1011c0 <isr_common>

001017bf <asm_isr_138>:
  1017bf:	fc                   	cld
  1017c0:	fa                   	cli
  1017c1:	6a 00                	push   $0x0
  1017c3:	68 8a 00 00 00       	push   $0x8a
  1017c8:	e9 f3 f9 ff ff       	jmp    1011c0 <isr_common>

001017cd <asm_isr_139>:
  1017cd:	fc                   	cld
  1017ce:	fa                   	cli
  1017cf:	6a 00                	push   $0x0
  1017d1:	68 8b 00 00 00       	push   $0x8b
  1017d6:	e9 e5 f9 ff ff       	jmp    1011c0 <isr_common>

001017db <asm_isr_140>:
  1017db:	fc                   	cld
  1017dc:	fa                   	cli
  1017dd:	6a 00                	push   $0x0
  1017df:	68 8c 00 00 00       	push   $0x8c
  1017e4:	e9 d7 f9 ff ff       	jmp    1011c0 <isr_common>

001017e9 <asm_isr_141>:
  1017e9:	fc                   	cld
  1017ea:	fa                   	cli
  1017eb:	6a 00                	push   $0x0
  1017ed:	68 8d 00 00 00       	push   $0x8d
  1017f2:	e9 c9 f9 ff ff       	jmp    1011c0 <isr_common>

001017f7 <asm_isr_142>:
  1017f7:	fc                   	cld
  1017f8:	fa                   	cli
  1017f9:	6a 00                	push   $0x0
  1017fb:	68 8e 00 00 00       	push   $0x8e
  101800:	e9 bb f9 ff ff       	jmp    1011c0 <isr_common>

00101805 <asm_isr_143>:
  101805:	fc                   	cld
  101806:	fa                   	cli
  101807:	6a 00                	push   $0x0
  101809:	68 8f 00 00 00       	push   $0x8f
  10180e:	e9 ad f9 ff ff       	jmp    1011c0 <isr_common>

00101813 <asm_isr_144>:
  101813:	fc                   	cld
  101814:	fa                   	cli
  101815:	6a 00                	push   $0x0
  101817:	68 90 00 00 00       	push   $0x90
  10181c:	e9 9f f9 ff ff       	jmp    1011c0 <isr_common>

00101821 <asm_isr_145>:
  101821:	fc                   	cld
  101822:	fa                   	cli
  101823:	6a 00                	push   $0x0
  101825:	68 91 00 00 00       	push   $0x91
  10182a:	e9 91 f9 ff ff       	jmp    1011c0 <isr_common>

0010182f <asm_isr_146>:
  10182f:	fc                   	cld
  101830:	fa                   	cli
  101831:	6a 00                	push   $0x0
  101833:	68 92 00 00 00       	push   $0x92
  101838:	e9 83 f9 ff ff       	jmp    1011c0 <isr_common>

0010183d <asm_isr_147>:
  10183d:	fc                   	cld
  10183e:	fa                   	cli
  10183f:	6a 00                	push   $0x0
  101841:	68 93 00 00 00       	push   $0x93
  101846:	e9 75 f9 ff ff       	jmp    1011c0 <isr_common>

0010184b <asm_isr_148>:
  10184b:	fc                   	cld
  10184c:	fa                   	cli
  10184d:	6a 00                	push   $0x0
  10184f:	68 94 00 00 00       	push   $0x94
  101854:	e9 67 f9 ff ff       	jmp    1011c0 <isr_common>

00101859 <asm_isr_149>:
  101859:	fc                   	cld
  10185a:	fa                   	cli
  10185b:	6a 00                	push   $0x0
  10185d:	68 95 00 00 00       	push   $0x95
  101862:	e9 59 f9 ff ff       	jmp    1011c0 <isr_common>

00101867 <asm_isr_150>:
  101867:	fc                   	cld
  101868:	fa                   	cli
  101869:	6a 00                	push   $0x0
  10186b:	68 96 00 00 00       	push   $0x96
  101870:	e9 4b f9 ff ff       	jmp    1011c0 <isr_common>

00101875 <asm_isr_151>:
  101875:	fc                   	cld
  101876:	fa                   	cli
  101877:	6a 00                	push   $0x0
  101879:	68 97 00 00 00       	push   $0x97
  10187e:	e9 3d f9 ff ff       	jmp    1011c0 <isr_common>

00101883 <asm_isr_152>:
  101883:	fc                   	cld
  101884:	fa                   	cli
  101885:	6a 00                	push   $0x0
  101887:	68 98 00 00 00       	push   $0x98
  10188c:	e9 2f f9 ff ff       	jmp    1011c0 <isr_common>

00101891 <asm_isr_153>:
  101891:	fc                   	cld
  101892:	fa                   	cli
  101893:	6a 00                	push   $0x0
  101895:	68 99 00 00 00       	push   $0x99
  10189a:	e9 21 f9 ff ff       	jmp    1011c0 <isr_common>

0010189f <asm_isr_154>:
  10189f:	fc                   	cld
  1018a0:	fa                   	cli
  1018a1:	6a 00                	push   $0x0
  1018a3:	68 9a 00 00 00       	push   $0x9a
  1018a8:	e9 13 f9 ff ff       	jmp    1011c0 <isr_common>

001018ad <asm_isr_155>:
  1018ad:	fc                   	cld
  1018ae:	fa                   	cli
  1018af:	6a 00                	push   $0x0
  1018b1:	68 9b 00 00 00       	push   $0x9b
  1018b6:	e9 05 f9 ff ff       	jmp    1011c0 <isr_common>

001018bb <asm_isr_156>:
  1018bb:	fc                   	cld
  1018bc:	fa                   	cli
  1018bd:	6a 00                	push   $0x0
  1018bf:	68 9c 00 00 00       	push   $0x9c
  1018c4:	e9 f7 f8 ff ff       	jmp    1011c0 <isr_common>

001018c9 <asm_isr_157>:
  1018c9:	fc                   	cld
  1018ca:	fa                   	cli
  1018cb:	6a 00                	push   $0x0
  1018cd:	68 9d 00 00 00       	push   $0x9d
  1018d2:	e9 e9 f8 ff ff       	jmp    1011c0 <isr_common>

001018d7 <asm_isr_158>:
  1018d7:	fc                   	cld
  1018d8:	fa                   	cli
  1018d9:	6a 00                	push   $0x0
  1018db:	68 9e 00 00 00       	push   $0x9e
  1018e0:	e9 db f8 ff ff       	jmp    1011c0 <isr_common>

001018e5 <asm_isr_159>:
  1018e5:	fc                   	cld
  1018e6:	fa                   	cli
  1018e7:	6a 00                	push   $0x0
  1018e9:	68 9f 00 00 00       	push   $0x9f
  1018ee:	e9 cd f8 ff ff       	jmp    1011c0 <isr_common>

001018f3 <asm_isr_160>:
  1018f3:	fc                   	cld
  1018f4:	fa                   	cli
  1018f5:	6a 00                	push   $0x0
  1018f7:	68 a0 00 00 00       	push   $0xa0
  1018fc:	e9 bf f8 ff ff       	jmp    1011c0 <isr_common>

00101901 <asm_isr_161>:
  101901:	fc                   	cld
  101902:	fa                   	cli
  101903:	6a 00                	push   $0x0
  101905:	68 a1 00 00 00       	push   $0xa1
  10190a:	e9 b1 f8 ff ff       	jmp    1011c0 <isr_common>

0010190f <asm_isr_162>:
  10190f:	fc                   	cld
  101910:	fa                   	cli
  101911:	6a 00                	push   $0x0
  101913:	68 a2 00 00 00       	push   $0xa2
  101918:	e9 a3 f8 ff ff       	jmp    1011c0 <isr_common>

0010191d <asm_isr_163>:
  10191d:	fc                   	cld
  10191e:	fa                   	cli
  10191f:	6a 00                	push   $0x0
  101921:	68 a3 00 00 00       	push   $0xa3
  101926:	e9 95 f8 ff ff       	jmp    1011c0 <isr_common>

0010192b <asm_isr_164>:
  10192b:	fc                   	cld
  10192c:	fa                   	cli
  10192d:	6a 00                	push   $0x0
  10192f:	68 a4 00 00 00       	push   $0xa4
  101934:	e9 87 f8 ff ff       	jmp    1011c0 <isr_common>

00101939 <asm_isr_165>:
  101939:	fc                   	cld
  10193a:	fa                   	cli
  10193b:	6a 00                	push   $0x0
  10193d:	68 a5 00 00 00       	push   $0xa5
  101942:	e9 79 f8 ff ff       	jmp    1011c0 <isr_common>

00101947 <asm_isr_166>:
  101947:	fc                   	cld
  101948:	fa                   	cli
  101949:	6a 00                	push   $0x0
  10194b:	68 a6 00 00 00       	push   $0xa6
  101950:	e9 6b f8 ff ff       	jmp    1011c0 <isr_common>

00101955 <asm_isr_167>:
  101955:	fc                   	cld
  101956:	fa                   	cli
  101957:	6a 00                	push   $0x0
  101959:	68 a7 00 00 00       	push   $0xa7
  10195e:	e9 5d f8 ff ff       	jmp    1011c0 <isr_common>

00101963 <asm_isr_168>:
  101963:	fc                   	cld
  101964:	fa                   	cli
  101965:	6a 00                	push   $0x0
  101967:	68 a8 00 00 00       	push   $0xa8
  10196c:	e9 4f f8 ff ff       	jmp    1011c0 <isr_common>

00101971 <asm_isr_169>:
  101971:	fc                   	cld
  101972:	fa                   	cli
  101973:	6a 00                	push   $0x0
  101975:	68 a9 00 00 00       	push   $0xa9
  10197a:	e9 41 f8 ff ff       	jmp    1011c0 <isr_common>

0010197f <asm_isr_170>:
  10197f:	fc                   	cld
  101980:	fa                   	cli
  101981:	6a 00                	push   $0x0
  101983:	68 aa 00 00 00       	push   $0xaa
  101988:	e9 33 f8 ff ff       	jmp    1011c0 <isr_common>

0010198d <asm_isr_171>:
  10198d:	fc                   	cld
  10198e:	fa                   	cli
  10198f:	6a 00                	push   $0x0
  101991:	68 ab 00 00 00       	push   $0xab
  101996:	e9 25 f8 ff ff       	jmp    1011c0 <isr_common>

0010199b <asm_isr_172>:
  10199b:	fc                   	cld
  10199c:	fa                   	cli
  10199d:	6a 00                	push   $0x0
  10199f:	68 ac 00 00 00       	push   $0xac
  1019a4:	e9 17 f8 ff ff       	jmp    1011c0 <isr_common>

001019a9 <asm_isr_173>:
  1019a9:	fc                   	cld
  1019aa:	fa                   	cli
  1019ab:	6a 00                	push   $0x0
  1019ad:	68 ad 00 00 00       	push   $0xad
  1019b2:	e9 09 f8 ff ff       	jmp    1011c0 <isr_common>

001019b7 <asm_isr_174>:
  1019b7:	fc                   	cld
  1019b8:	fa                   	cli
  1019b9:	6a 00                	push   $0x0
  1019bb:	68 ae 00 00 00       	push   $0xae
  1019c0:	e9 fb f7 ff ff       	jmp    1011c0 <isr_common>

001019c5 <asm_isr_175>:
  1019c5:	fc                   	cld
  1019c6:	fa                   	cli
  1019c7:	6a 00                	push   $0x0
  1019c9:	68 af 00 00 00       	push   $0xaf
  1019ce:	e9 ed f7 ff ff       	jmp    1011c0 <isr_common>

001019d3 <asm_isr_176>:
  1019d3:	fc                   	cld
  1019d4:	fa                   	cli
  1019d5:	6a 00                	push   $0x0
  1019d7:	68 b0 00 00 00       	push   $0xb0
  1019dc:	e9 df f7 ff ff       	jmp    1011c0 <isr_common>

001019e1 <asm_isr_177>:
  1019e1:	fc                   	cld
  1019e2:	fa                   	cli
  1019e3:	6a 00                	push   $0x0
  1019e5:	68 b1 00 00 00       	push   $0xb1
  1019ea:	e9 d1 f7 ff ff       	jmp    1011c0 <isr_common>

001019ef <asm_isr_178>:
  1019ef:	fc                   	cld
  1019f0:	fa                   	cli
  1019f1:	6a 00                	push   $0x0
  1019f3:	68 b2 00 00 00       	push   $0xb2
  1019f8:	e9 c3 f7 ff ff       	jmp    1011c0 <isr_common>

001019fd <asm_isr_179>:
  1019fd:	fc                   	cld
  1019fe:	fa                   	cli
  1019ff:	6a 00                	push   $0x0
  101a01:	68 b3 00 00 00       	push   $0xb3
  101a06:	e9 b5 f7 ff ff       	jmp    1011c0 <isr_common>

00101a0b <asm_isr_180>:
  101a0b:	fc                   	cld
  101a0c:	fa                   	cli
  101a0d:	6a 00                	push   $0x0
  101a0f:	68 b4 00 00 00       	push   $0xb4
  101a14:	e9 a7 f7 ff ff       	jmp    1011c0 <isr_common>

00101a19 <asm_isr_181>:
  101a19:	fc                   	cld
  101a1a:	fa                   	cli
  101a1b:	6a 00                	push   $0x0
  101a1d:	68 b5 00 00 00       	push   $0xb5
  101a22:	e9 99 f7 ff ff       	jmp    1011c0 <isr_common>

00101a27 <asm_isr_182>:
  101a27:	fc                   	cld
  101a28:	fa                   	cli
  101a29:	6a 00                	push   $0x0
  101a2b:	68 b6 00 00 00       	push   $0xb6
  101a30:	e9 8b f7 ff ff       	jmp    1011c0 <isr_common>

00101a35 <asm_isr_183>:
  101a35:	fc                   	cld
  101a36:	fa                   	cli
  101a37:	6a 00                	push   $0x0
  101a39:	68 b7 00 00 00       	push   $0xb7
  101a3e:	e9 7d f7 ff ff       	jmp    1011c0 <isr_common>

00101a43 <asm_isr_184>:
  101a43:	fc                   	cld
  101a44:	fa                   	cli
  101a45:	6a 00                	push   $0x0
  101a47:	68 b8 00 00 00       	push   $0xb8
  101a4c:	e9 6f f7 ff ff       	jmp    1011c0 <isr_common>

00101a51 <asm_isr_185>:
  101a51:	fc                   	cld
  101a52:	fa                   	cli
  101a53:	6a 00                	push   $0x0
  101a55:	68 b9 00 00 00       	push   $0xb9
  101a5a:	e9 61 f7 ff ff       	jmp    1011c0 <isr_common>

00101a5f <asm_isr_186>:
  101a5f:	fc                   	cld
  101a60:	fa                   	cli
  101a61:	6a 00                	push   $0x0
  101a63:	68 ba 00 00 00       	push   $0xba
  101a68:	e9 53 f7 ff ff       	jmp    1011c0 <isr_common>

00101a6d <asm_isr_187>:
  101a6d:	fc                   	cld
  101a6e:	fa                   	cli
  101a6f:	6a 00                	push   $0x0
  101a71:	68 bb 00 00 00       	push   $0xbb
  101a76:	e9 45 f7 ff ff       	jmp    1011c0 <isr_common>

00101a7b <asm_isr_188>:
  101a7b:	fc                   	cld
  101a7c:	fa                   	cli
  101a7d:	6a 00                	push   $0x0
  101a7f:	68 bc 00 00 00       	push   $0xbc
  101a84:	e9 37 f7 ff ff       	jmp    1011c0 <isr_common>

00101a89 <asm_isr_189>:
  101a89:	fc                   	cld
  101a8a:	fa                   	cli
  101a8b:	6a 00                	push   $0x0
  101a8d:	68 bd 00 00 00       	push   $0xbd
  101a92:	e9 29 f7 ff ff       	jmp    1011c0 <isr_common>

00101a97 <asm_isr_190>:
  101a97:	fc                   	cld
  101a98:	fa                   	cli
  101a99:	6a 00                	push   $0x0
  101a9b:	68 be 00 00 00       	push   $0xbe
  101aa0:	e9 1b f7 ff ff       	jmp    1011c0 <isr_common>

00101aa5 <asm_isr_191>:
  101aa5:	fc                   	cld
  101aa6:	fa                   	cli
  101aa7:	6a 00                	push   $0x0
  101aa9:	68 bf 00 00 00       	push   $0xbf
  101aae:	e9 0d f7 ff ff       	jmp    1011c0 <isr_common>

00101ab3 <asm_isr_192>:
  101ab3:	fc                   	cld
  101ab4:	fa                   	cli
  101ab5:	6a 00                	push   $0x0
  101ab7:	68 c0 00 00 00       	push   $0xc0
  101abc:	e9 ff f6 ff ff       	jmp    1011c0 <isr_common>

00101ac1 <asm_isr_193>:
  101ac1:	fc                   	cld
  101ac2:	fa                   	cli
  101ac3:	6a 00                	push   $0x0
  101ac5:	68 c1 00 00 00       	push   $0xc1
  101aca:	e9 f1 f6 ff ff       	jmp    1011c0 <isr_common>

00101acf <asm_isr_194>:
  101acf:	fc                   	cld
  101ad0:	fa                   	cli
  101ad1:	6a 00                	push   $0x0
  101ad3:	68 c2 00 00 00       	push   $0xc2
  101ad8:	e9 e3 f6 ff ff       	jmp    1011c0 <isr_common>

00101add <asm_isr_195>:
  101add:	fc                   	cld
  101ade:	fa                   	cli
  101adf:	6a 00                	push   $0x0
  101ae1:	68 c3 00 00 00       	push   $0xc3
  101ae6:	e9 d5 f6 ff ff       	jmp    1011c0 <isr_common>

00101aeb <asm_isr_196>:
  101aeb:	fc                   	cld
  101aec:	fa                   	cli
  101aed:	6a 00                	push   $0x0
  101aef:	68 c4 00 00 00       	push   $0xc4
  101af4:	e9 c7 f6 ff ff       	jmp    1011c0 <isr_common>

00101af9 <asm_isr_197>:
  101af9:	fc                   	cld
  101afa:	fa                   	cli
  101afb:	6a 00                	push   $0x0
  101afd:	68 c5 00 00 00       	push   $0xc5
  101b02:	e9 b9 f6 ff ff       	jmp    1011c0 <isr_common>

00101b07 <asm_isr_198>:
  101b07:	fc                   	cld
  101b08:	fa                   	cli
  101b09:	6a 00                	push   $0x0
  101b0b:	68 c6 00 00 00       	push   $0xc6
  101b10:	e9 ab f6 ff ff       	jmp    1011c0 <isr_common>

00101b15 <asm_isr_199>:
  101b15:	fc                   	cld
  101b16:	fa                   	cli
  101b17:	6a 00                	push   $0x0
  101b19:	68 c7 00 00 00       	push   $0xc7
  101b1e:	e9 9d f6 ff ff       	jmp    1011c0 <isr_common>

00101b23 <asm_isr_200>:
  101b23:	fc                   	cld
  101b24:	fa                   	cli
  101b25:	6a 00                	push   $0x0
  101b27:	68 c8 00 00 00       	push   $0xc8
  101b2c:	e9 8f f6 ff ff       	jmp    1011c0 <isr_common>

00101b31 <asm_isr_201>:
  101b31:	fc                   	cld
  101b32:	fa                   	cli
  101b33:	6a 00                	push   $0x0
  101b35:	68 c9 00 00 00       	push   $0xc9
  101b3a:	e9 81 f6 ff ff       	jmp    1011c0 <isr_common>

00101b3f <asm_isr_202>:
  101b3f:	fc                   	cld
  101b40:	fa                   	cli
  101b41:	6a 00                	push   $0x0
  101b43:	68 ca 00 00 00       	push   $0xca
  101b48:	e9 73 f6 ff ff       	jmp    1011c0 <isr_common>

00101b4d <asm_isr_203>:
  101b4d:	fc                   	cld
  101b4e:	fa                   	cli
  101b4f:	6a 00                	push   $0x0
  101b51:	68 cb 00 00 00       	push   $0xcb
  101b56:	e9 65 f6 ff ff       	jmp    1011c0 <isr_common>

00101b5b <asm_isr_204>:
  101b5b:	fc                   	cld
  101b5c:	fa                   	cli
  101b5d:	6a 00                	push   $0x0
  101b5f:	68 cc 00 00 00       	push   $0xcc
  101b64:	e9 57 f6 ff ff       	jmp    1011c0 <isr_common>

00101b69 <asm_isr_205>:
  101b69:	fc                   	cld
  101b6a:	fa                   	cli
  101b6b:	6a 00                	push   $0x0
  101b6d:	68 cd 00 00 00       	push   $0xcd
  101b72:	e9 49 f6 ff ff       	jmp    1011c0 <isr_common>

00101b77 <asm_isr_206>:
  101b77:	fc                   	cld
  101b78:	fa                   	cli
  101b79:	6a 00                	push   $0x0
  101b7b:	68 ce 00 00 00       	push   $0xce
  101b80:	e9 3b f6 ff ff       	jmp    1011c0 <isr_common>

00101b85 <asm_isr_207>:
  101b85:	fc                   	cld
  101b86:	fa                   	cli
  101b87:	6a 00                	push   $0x0
  101b89:	68 cf 00 00 00       	push   $0xcf
  101b8e:	e9 2d f6 ff ff       	jmp    1011c0 <isr_common>

00101b93 <asm_isr_208>:
  101b93:	fc                   	cld
  101b94:	fa                   	cli
  101b95:	6a 00                	push   $0x0
  101b97:	68 d0 00 00 00       	push   $0xd0
  101b9c:	e9 1f f6 ff ff       	jmp    1011c0 <isr_common>

00101ba1 <asm_isr_209>:
  101ba1:	fc                   	cld
  101ba2:	fa                   	cli
  101ba3:	6a 00                	push   $0x0
  101ba5:	68 d1 00 00 00       	push   $0xd1
  101baa:	e9 11 f6 ff ff       	jmp    1011c0 <isr_common>

00101baf <asm_isr_210>:
  101baf:	fc                   	cld
  101bb0:	fa                   	cli
  101bb1:	6a 00                	push   $0x0
  101bb3:	68 d2 00 00 00       	push   $0xd2
  101bb8:	e9 03 f6 ff ff       	jmp    1011c0 <isr_common>

00101bbd <asm_isr_211>:
  101bbd:	fc                   	cld
  101bbe:	fa                   	cli
  101bbf:	6a 00                	push   $0x0
  101bc1:	68 d3 00 00 00       	push   $0xd3
  101bc6:	e9 f5 f5 ff ff       	jmp    1011c0 <isr_common>

00101bcb <asm_isr_212>:
  101bcb:	fc                   	cld
  101bcc:	fa                   	cli
  101bcd:	6a 00                	push   $0x0
  101bcf:	68 d4 00 00 00       	push   $0xd4
  101bd4:	e9 e7 f5 ff ff       	jmp    1011c0 <isr_common>

00101bd9 <asm_isr_213>:
  101bd9:	fc                   	cld
  101bda:	fa                   	cli
  101bdb:	6a 00                	push   $0x0
  101bdd:	68 d5 00 00 00       	push   $0xd5
  101be2:	e9 d9 f5 ff ff       	jmp    1011c0 <isr_common>

00101be7 <asm_isr_214>:
  101be7:	fc                   	cld
  101be8:	fa                   	cli
  101be9:	6a 00                	push   $0x0
  101beb:	68 d6 00 00 00       	push   $0xd6
  101bf0:	e9 cb f5 ff ff       	jmp    1011c0 <isr_common>

00101bf5 <asm_isr_215>:
  101bf5:	fc                   	cld
  101bf6:	fa                   	cli
  101bf7:	6a 00                	push   $0x0
  101bf9:	68 d7 00 00 00       	push   $0xd7
  101bfe:	e9 bd f5 ff ff       	jmp    1011c0 <isr_common>

00101c03 <asm_isr_216>:
  101c03:	fc                   	cld
  101c04:	fa                   	cli
  101c05:	6a 00                	push   $0x0
  101c07:	68 d8 00 00 00       	push   $0xd8
  101c0c:	e9 af f5 ff ff       	jmp    1011c0 <isr_common>

00101c11 <asm_isr_217>:
  101c11:	fc                   	cld
  101c12:	fa                   	cli
  101c13:	6a 00                	push   $0x0
  101c15:	68 d9 00 00 00       	push   $0xd9
  101c1a:	e9 a1 f5 ff ff       	jmp    1011c0 <isr_common>

00101c1f <asm_isr_218>:
  101c1f:	fc                   	cld
  101c20:	fa                   	cli
  101c21:	6a 00                	push   $0x0
  101c23:	68 da 00 00 00       	push   $0xda
  101c28:	e9 93 f5 ff ff       	jmp    1011c0 <isr_common>

00101c2d <asm_isr_219>:
  101c2d:	fc                   	cld
  101c2e:	fa                   	cli
  101c2f:	6a 00                	push   $0x0
  101c31:	68 db 00 00 00       	push   $0xdb
  101c36:	e9 85 f5 ff ff       	jmp    1011c0 <isr_common>

00101c3b <asm_isr_220>:
  101c3b:	fc                   	cld
  101c3c:	fa                   	cli
  101c3d:	6a 00                	push   $0x0
  101c3f:	68 dc 00 00 00       	push   $0xdc
  101c44:	e9 77 f5 ff ff       	jmp    1011c0 <isr_common>

00101c49 <asm_isr_221>:
  101c49:	fc                   	cld
  101c4a:	fa                   	cli
  101c4b:	6a 00                	push   $0x0
  101c4d:	68 dd 00 00 00       	push   $0xdd
  101c52:	e9 69 f5 ff ff       	jmp    1011c0 <isr_common>

00101c57 <asm_isr_222>:
  101c57:	fc                   	cld
  101c58:	fa                   	cli
  101c59:	6a 00                	push   $0x0
  101c5b:	68 de 00 00 00       	push   $0xde
  101c60:	e9 5b f5 ff ff       	jmp    1011c0 <isr_common>

00101c65 <asm_isr_223>:
  101c65:	fc                   	cld
  101c66:	fa                   	cli
  101c67:	6a 00                	push   $0x0
  101c69:	68 df 00 00 00       	push   $0xdf
  101c6e:	e9 4d f5 ff ff       	jmp    1011c0 <isr_common>

00101c73 <asm_isr_224>:
  101c73:	fc                   	cld
  101c74:	fa                   	cli
  101c75:	6a 00                	push   $0x0
  101c77:	68 e0 00 00 00       	push   $0xe0
  101c7c:	e9 3f f5 ff ff       	jmp    1011c0 <isr_common>

00101c81 <asm_isr_225>:
  101c81:	fc                   	cld
  101c82:	fa                   	cli
  101c83:	6a 00                	push   $0x0
  101c85:	68 e1 00 00 00       	push   $0xe1
  101c8a:	e9 31 f5 ff ff       	jmp    1011c0 <isr_common>

00101c8f <asm_isr_226>:
  101c8f:	fc                   	cld
  101c90:	fa                   	cli
  101c91:	6a 00                	push   $0x0
  101c93:	68 e2 00 00 00       	push   $0xe2
  101c98:	e9 23 f5 ff ff       	jmp    1011c0 <isr_common>

00101c9d <asm_isr_227>:
  101c9d:	fc                   	cld
  101c9e:	fa                   	cli
  101c9f:	6a 00                	push   $0x0
  101ca1:	68 e3 00 00 00       	push   $0xe3
  101ca6:	e9 15 f5 ff ff       	jmp    1011c0 <isr_common>

00101cab <asm_isr_228>:
  101cab:	fc                   	cld
  101cac:	fa                   	cli
  101cad:	6a 00                	push   $0x0
  101caf:	68 e4 00 00 00       	push   $0xe4
  101cb4:	e9 07 f5 ff ff       	jmp    1011c0 <isr_common>

00101cb9 <asm_isr_229>:
  101cb9:	fc                   	cld
  101cba:	fa                   	cli
  101cbb:	6a 00                	push   $0x0
  101cbd:	68 e5 00 00 00       	push   $0xe5
  101cc2:	e9 f9 f4 ff ff       	jmp    1011c0 <isr_common>

00101cc7 <asm_isr_230>:
  101cc7:	fc                   	cld
  101cc8:	fa                   	cli
  101cc9:	6a 00                	push   $0x0
  101ccb:	68 e6 00 00 00       	push   $0xe6
  101cd0:	e9 eb f4 ff ff       	jmp    1011c0 <isr_common>

00101cd5 <asm_isr_231>:
  101cd5:	fc                   	cld
  101cd6:	fa                   	cli
  101cd7:	6a 00                	push   $0x0
  101cd9:	68 e7 00 00 00       	push   $0xe7
  101cde:	e9 dd f4 ff ff       	jmp    1011c0 <isr_common>

00101ce3 <asm_isr_232>:
  101ce3:	fc                   	cld
  101ce4:	fa                   	cli
  101ce5:	6a 00                	push   $0x0
  101ce7:	68 e8 00 00 00       	push   $0xe8
  101cec:	e9 cf f4 ff ff       	jmp    1011c0 <isr_common>

00101cf1 <asm_isr_233>:
  101cf1:	fc                   	cld
  101cf2:	fa                   	cli
  101cf3:	6a 00                	push   $0x0
  101cf5:	68 e9 00 00 00       	push   $0xe9
  101cfa:	e9 c1 f4 ff ff       	jmp    1011c0 <isr_common>

00101cff <asm_isr_234>:
  101cff:	fc                   	cld
  101d00:	fa                   	cli
  101d01:	6a 00                	push   $0x0
  101d03:	68 ea 00 00 00       	push   $0xea
  101d08:	e9 b3 f4 ff ff       	jmp    1011c0 <isr_common>

00101d0d <asm_isr_235>:
  101d0d:	fc                   	cld
  101d0e:	fa                   	cli
  101d0f:	6a 00                	push   $0x0
  101d11:	68 eb 00 00 00       	push   $0xeb
  101d16:	e9 a5 f4 ff ff       	jmp    1011c0 <isr_common>

00101d1b <asm_isr_236>:
  101d1b:	fc                   	cld
  101d1c:	fa                   	cli
  101d1d:	6a 00                	push   $0x0
  101d1f:	68 ec 00 00 00       	push   $0xec
  101d24:	e9 97 f4 ff ff       	jmp    1011c0 <isr_common>

00101d29 <asm_isr_237>:
  101d29:	fc                   	cld
  101d2a:	fa                   	cli
  101d2b:	6a 00                	push   $0x0
  101d2d:	68 ed 00 00 00       	push   $0xed
  101d32:	e9 89 f4 ff ff       	jmp    1011c0 <isr_common>

00101d37 <asm_isr_238>:
  101d37:	fc                   	cld
  101d38:	fa                   	cli
  101d39:	6a 00                	push   $0x0
  101d3b:	68 ee 00 00 00       	push   $0xee
  101d40:	e9 7b f4 ff ff       	jmp    1011c0 <isr_common>

00101d45 <asm_isr_239>:
  101d45:	fc                   	cld
  101d46:	fa                   	cli
  101d47:	6a 00                	push   $0x0
  101d49:	68 ef 00 00 00       	push   $0xef
  101d4e:	e9 6d f4 ff ff       	jmp    1011c0 <isr_common>

00101d53 <asm_isr_240>:
  101d53:	fc                   	cld
  101d54:	fa                   	cli
  101d55:	6a 00                	push   $0x0
  101d57:	68 f0 00 00 00       	push   $0xf0
  101d5c:	e9 5f f4 ff ff       	jmp    1011c0 <isr_common>

00101d61 <asm_isr_241>:
  101d61:	fc                   	cld
  101d62:	fa                   	cli
  101d63:	6a 00                	push   $0x0
  101d65:	68 f1 00 00 00       	push   $0xf1
  101d6a:	e9 51 f4 ff ff       	jmp    1011c0 <isr_common>

00101d6f <asm_isr_242>:
  101d6f:	fc                   	cld
  101d70:	fa                   	cli
  101d71:	6a 00                	push   $0x0
  101d73:	68 f2 00 00 00       	push   $0xf2
  101d78:	e9 43 f4 ff ff       	jmp    1011c0 <isr_common>

00101d7d <asm_isr_243>:
  101d7d:	fc                   	cld
  101d7e:	fa                   	cli
  101d7f:	6a 00                	push   $0x0
  101d81:	68 f3 00 00 00       	push   $0xf3
  101d86:	e9 35 f4 ff ff       	jmp    1011c0 <isr_common>

00101d8b <asm_isr_244>:
  101d8b:	fc                   	cld
  101d8c:	fa                   	cli
  101d8d:	6a 00                	push   $0x0
  101d8f:	68 f4 00 00 00       	push   $0xf4
  101d94:	e9 27 f4 ff ff       	jmp    1011c0 <isr_common>

00101d99 <asm_isr_245>:
  101d99:	fc                   	cld
  101d9a:	fa                   	cli
  101d9b:	6a 00                	push   $0x0
  101d9d:	68 f5 00 00 00       	push   $0xf5
  101da2:	e9 19 f4 ff ff       	jmp    1011c0 <isr_common>

00101da7 <asm_isr_246>:
  101da7:	fc                   	cld
  101da8:	fa                   	cli
  101da9:	6a 00                	push   $0x0
  101dab:	68 f6 00 00 00       	push   $0xf6
  101db0:	e9 0b f4 ff ff       	jmp    1011c0 <isr_common>

00101db5 <asm_isr_247>:
  101db5:	fc                   	cld
  101db6:	fa                   	cli
  101db7:	6a 00                	push   $0x0
  101db9:	68 f7 00 00 00       	push   $0xf7
  101dbe:	e9 fd f3 ff ff       	jmp    1011c0 <isr_common>

00101dc3 <asm_isr_248>:
  101dc3:	fc                   	cld
  101dc4:	fa                   	cli
  101dc5:	6a 00                	push   $0x0
  101dc7:	68 f8 00 00 00       	push   $0xf8
  101dcc:	e9 ef f3 ff ff       	jmp    1011c0 <isr_common>

00101dd1 <asm_isr_249>:
  101dd1:	fc                   	cld
  101dd2:	fa                   	cli
  101dd3:	6a 00                	push   $0x0
  101dd5:	68 f9 00 00 00       	push   $0xf9
  101dda:	e9 e1 f3 ff ff       	jmp    1011c0 <isr_common>

00101ddf <asm_isr_250>:
  101ddf:	fc                   	cld
  101de0:	fa                   	cli
  101de1:	6a 00                	push   $0x0
  101de3:	68 fa 00 00 00       	push   $0xfa
  101de8:	e9 d3 f3 ff ff       	jmp    1011c0 <isr_common>

00101ded <asm_isr_251>:
  101ded:	fc                   	cld
  101dee:	fa                   	cli
  101def:	6a 00                	push   $0x0
  101df1:	68 fb 00 00 00       	push   $0xfb
  101df6:	e9 c5 f3 ff ff       	jmp    1011c0 <isr_common>

00101dfb <asm_isr_252>:
  101dfb:	fc                   	cld
  101dfc:	fa                   	cli
  101dfd:	6a 00                	push   $0x0
  101dff:	68 fc 00 00 00       	push   $0xfc
  101e04:	e9 b7 f3 ff ff       	jmp    1011c0 <isr_common>

00101e09 <asm_isr_253>:
  101e09:	fc                   	cld
  101e0a:	fa                   	cli
  101e0b:	6a 00                	push   $0x0
  101e0d:	68 fd 00 00 00       	push   $0xfd
  101e12:	e9 a9 f3 ff ff       	jmp    1011c0 <isr_common>

00101e17 <asm_isr_254>:
  101e17:	fc                   	cld
  101e18:	fa                   	cli
  101e19:	6a 00                	push   $0x0
  101e1b:	68 fe 00 00 00       	push   $0xfe
  101e20:	e9 9b f3 ff ff       	jmp    1011c0 <isr_common>

00101e25 <asm_isr_255>:
  101e25:	fc                   	cld
  101e26:	fa                   	cli
  101e27:	6a 00                	push   $0x0
  101e29:	68 ff 00 00 00       	push   $0xff
  101e2e:	e9 8d f3 ff ff       	jmp    1011c0 <isr_common>

00101e33 <uart_init>:
  101e33:	55                   	push   %ebp
  101e34:	89 e5                	mov    %esp,%ebp
  101e36:	83 ec 28             	sub    $0x28,%esp
  101e39:	8b 45 08             	mov    0x8(%ebp),%eax
  101e3c:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  101e40:	b8 00 c2 01 00       	mov    $0x1c200,%eax
  101e45:	ba 00 00 00 00       	mov    $0x0,%edx
  101e4a:	f7 75 0c             	divl   0xc(%ebp)
  101e4d:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  101e51:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101e55:	83 c0 02             	add    $0x2,%eax
  101e58:	0f b7 c0             	movzwl %ax,%eax
  101e5b:	83 ec 08             	sub    $0x8,%esp
  101e5e:	6a 00                	push   $0x0
  101e60:	50                   	push   %eax
  101e61:	e8 76 ee ff ff       	call   100cdc <outb>
  101e66:	83 c4 10             	add    $0x10,%esp
  101e69:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101e6d:	83 c0 03             	add    $0x3,%eax
  101e70:	0f b7 c0             	movzwl %ax,%eax
  101e73:	83 ec 08             	sub    $0x8,%esp
  101e76:	68 80 00 00 00       	push   $0x80
  101e7b:	50                   	push   %eax
  101e7c:	e8 5b ee ff ff       	call   100cdc <outb>
  101e81:	83 c4 10             	add    $0x10,%esp
  101e84:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101e88:	0f b6 d0             	movzbl %al,%edx
  101e8b:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101e8f:	83 ec 08             	sub    $0x8,%esp
  101e92:	52                   	push   %edx
  101e93:	50                   	push   %eax
  101e94:	e8 43 ee ff ff       	call   100cdc <outb>
  101e99:	83 c4 10             	add    $0x10,%esp
  101e9c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101ea0:	66 c1 e8 08          	shr    $0x8,%ax
  101ea4:	0f b6 d0             	movzbl %al,%edx
  101ea7:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101eab:	83 c0 01             	add    $0x1,%eax
  101eae:	0f b7 c0             	movzwl %ax,%eax
  101eb1:	83 ec 08             	sub    $0x8,%esp
  101eb4:	52                   	push   %edx
  101eb5:	50                   	push   %eax
  101eb6:	e8 21 ee ff ff       	call   100cdc <outb>
  101ebb:	83 c4 10             	add    $0x10,%esp
  101ebe:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101ec2:	83 c0 03             	add    $0x3,%eax
  101ec5:	0f b7 c0             	movzwl %ax,%eax
  101ec8:	83 ec 08             	sub    $0x8,%esp
  101ecb:	6a 03                	push   $0x3
  101ecd:	50                   	push   %eax
  101ece:	e8 09 ee ff ff       	call   100cdc <outb>
  101ed3:	83 c4 10             	add    $0x10,%esp
  101ed6:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101eda:	83 c0 04             	add    $0x4,%eax
  101edd:	0f b7 c0             	movzwl %ax,%eax
  101ee0:	83 ec 08             	sub    $0x8,%esp
  101ee3:	6a 00                	push   $0x0
  101ee5:	50                   	push   %eax
  101ee6:	e8 f1 ed ff ff       	call   100cdc <outb>
  101eeb:	83 c4 10             	add    $0x10,%esp
  101eee:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101ef2:	83 c0 04             	add    $0x4,%eax
  101ef5:	0f b7 c0             	movzwl %ax,%eax
  101ef8:	83 ec 08             	sub    $0x8,%esp
  101efb:	6a 1e                	push   $0x1e
  101efd:	50                   	push   %eax
  101efe:	e8 d9 ed ff ff       	call   100cdc <outb>
  101f03:	83 c4 10             	add    $0x10,%esp
  101f06:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101f0a:	83 ec 08             	sub    $0x8,%esp
  101f0d:	68 ee 00 00 00       	push   $0xee
  101f12:	50                   	push   %eax
  101f13:	e8 c4 ed ff ff       	call   100cdc <outb>
  101f18:	83 c4 10             	add    $0x10,%esp
  101f1b:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101f1f:	83 ec 0c             	sub    $0xc,%esp
  101f22:	50                   	push   %eax
  101f23:	e8 26 ee ff ff       	call   100d4e <inb>
  101f28:	83 c4 10             	add    $0x10,%esp
  101f2b:	3c ee                	cmp    $0xee,%al
  101f2d:	75 1a                	jne    101f49 <uart_init+0x116>
  101f2f:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  101f33:	83 c0 04             	add    $0x4,%eax
  101f36:	0f b7 c0             	movzwl %ax,%eax
  101f39:	83 ec 08             	sub    $0x8,%esp
  101f3c:	6a 0f                	push   $0xf
  101f3e:	50                   	push   %eax
  101f3f:	e8 98 ed ff ff       	call   100cdc <outb>
  101f44:	83 c4 10             	add    $0x10,%esp
  101f47:	eb 01                	jmp    101f4a <uart_init+0x117>
  101f49:	90                   	nop
  101f4a:	c9                   	leave
  101f4b:	c3                   	ret

00101f4c <uart_putchar>:
  101f4c:	55                   	push   %ebp
  101f4d:	89 e5                	mov    %esp,%ebp
  101f4f:	83 ec 18             	sub    $0x18,%esp
  101f52:	8b 55 08             	mov    0x8(%ebp),%edx
  101f55:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f58:	66 89 55 f4          	mov    %dx,-0xc(%ebp)
  101f5c:	88 45 f0             	mov    %al,-0x10(%ebp)
  101f5f:	90                   	nop
  101f60:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  101f64:	83 c0 05             	add    $0x5,%eax
  101f67:	0f b7 c0             	movzwl %ax,%eax
  101f6a:	83 ec 0c             	sub    $0xc,%esp
  101f6d:	50                   	push   %eax
  101f6e:	e8 db ed ff ff       	call   100d4e <inb>
  101f73:	83 c4 10             	add    $0x10,%esp
  101f76:	0f b6 c0             	movzbl %al,%eax
  101f79:	83 e0 20             	and    $0x20,%eax
  101f7c:	85 c0                	test   %eax,%eax
  101f7e:	74 e0                	je     101f60 <uart_putchar+0x14>
  101f80:	0f b6 55 f0          	movzbl -0x10(%ebp),%edx
  101f84:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  101f88:	83 ec 08             	sub    $0x8,%esp
  101f8b:	52                   	push   %edx
  101f8c:	50                   	push   %eax
  101f8d:	e8 4a ed ff ff       	call   100cdc <outb>
  101f92:	83 c4 10             	add    $0x10,%esp
  101f95:	90                   	nop
  101f96:	c9                   	leave
  101f97:	c3                   	ret

00101f98 <uart_getchar>:
  101f98:	55                   	push   %ebp
  101f99:	89 e5                	mov    %esp,%ebp
  101f9b:	83 ec 18             	sub    $0x18,%esp
  101f9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa1:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  101fa5:	90                   	nop
  101fa6:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  101faa:	83 c0 05             	add    $0x5,%eax
  101fad:	0f b7 c0             	movzwl %ax,%eax
  101fb0:	83 ec 0c             	sub    $0xc,%esp
  101fb3:	50                   	push   %eax
  101fb4:	e8 95 ed ff ff       	call   100d4e <inb>
  101fb9:	83 c4 10             	add    $0x10,%esp
  101fbc:	0f b6 c0             	movzbl %al,%eax
  101fbf:	83 e0 01             	and    $0x1,%eax
  101fc2:	85 c0                	test   %eax,%eax
  101fc4:	74 e0                	je     101fa6 <uart_getchar+0xe>
  101fc6:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  101fca:	83 ec 0c             	sub    $0xc,%esp
  101fcd:	50                   	push   %eax
  101fce:	e8 7b ed ff ff       	call   100d4e <inb>
  101fd3:	83 c4 10             	add    $0x10,%esp
  101fd6:	c9                   	leave
  101fd7:	c3                   	ret

00101fd8 <com1_putchar>:
  101fd8:	55                   	push   %ebp
  101fd9:	89 e5                	mov    %esp,%ebp
  101fdb:	83 ec 18             	sub    $0x18,%esp
  101fde:	8b 45 08             	mov    0x8(%ebp),%eax
  101fe1:	88 45 f4             	mov    %al,-0xc(%ebp)
  101fe4:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  101fe8:	0f b6 c0             	movzbl %al,%eax
  101feb:	83 ec 08             	sub    $0x8,%esp
  101fee:	50                   	push   %eax
  101fef:	68 f8 03 00 00       	push   $0x3f8
  101ff4:	e8 53 ff ff ff       	call   101f4c <uart_putchar>
  101ff9:	83 c4 10             	add    $0x10,%esp
  101ffc:	90                   	nop
  101ffd:	c9                   	leave
  101ffe:	c3                   	ret
  101fff:	90                   	nop

00102000 <enable_paging>:
  102000:	50                   	push   %eax
  102001:	0f 20 c0             	mov    %cr0,%eax
  102004:	0d 01 00 00 80       	or     $0x80000001,%eax
  102009:	0f 22 c0             	mov    %eax,%cr0
  10200c:	58                   	pop    %eax
  10200d:	c3                   	ret

0010200e <disable_paging>:
  10200e:	50                   	push   %eax
  10200f:	0f 20 c0             	mov    %cr0,%eax
  102012:	25 fe ff ff 7f       	and    $0x7ffffffe,%eax
  102017:	0f 22 c0             	mov    %eax,%cr0
  10201a:	58                   	pop    %eax
  10201b:	c3                   	ret

0010201c <memset>:
  10201c:	55                   	push   %ebp
  10201d:	89 e5                	mov    %esp,%ebp
  10201f:	83 ec 14             	sub    $0x14,%esp
  102022:	8b 45 0c             	mov    0xc(%ebp),%eax
  102025:	88 45 ec             	mov    %al,-0x14(%ebp)
  102028:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10202f:	eb 13                	jmp    102044 <memset+0x28>
  102031:	8b 45 08             	mov    0x8(%ebp),%eax
  102034:	8d 50 01             	lea    0x1(%eax),%edx
  102037:	89 55 08             	mov    %edx,0x8(%ebp)
  10203a:	0f b6 55 ec          	movzbl -0x14(%ebp),%edx
  10203e:	88 10                	mov    %dl,(%eax)
  102040:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102044:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102047:	3b 45 10             	cmp    0x10(%ebp),%eax
  10204a:	72 e5                	jb     102031 <memset+0x15>
  10204c:	8b 45 08             	mov    0x8(%ebp),%eax
  10204f:	c9                   	leave
  102050:	c3                   	ret

00102051 <itoa>:
  102051:	55                   	push   %ebp
  102052:	89 e5                	mov    %esp,%ebp
  102054:	83 ec 10             	sub    $0x10,%esp
  102057:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
  10205b:	7e 06                	jle    102063 <itoa+0x12>
  10205d:	83 7d 10 24          	cmpl   $0x24,0x10(%ebp)
  102061:	7e 0e                	jle    102071 <itoa+0x20>
  102063:	8b 45 0c             	mov    0xc(%ebp),%eax
  102066:	c6 00 00             	movb   $0x0,(%eax)
  102069:	8b 45 0c             	mov    0xc(%ebp),%eax
  10206c:	e9 9d 00 00 00       	jmp    10210e <itoa+0xbd>
  102071:	8b 45 0c             	mov    0xc(%ebp),%eax
  102074:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102077:	8b 45 0c             	mov    0xc(%ebp),%eax
  10207a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10207d:	8b 45 08             	mov    0x8(%ebp),%eax
  102080:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102083:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102086:	8b 45 08             	mov    0x8(%ebp),%eax
  102089:	ba 00 00 00 00       	mov    $0x0,%edx
  10208e:	f7 f1                	div    %ecx
  102090:	89 45 08             	mov    %eax,0x8(%ebp)
  102093:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102096:	8b 45 10             	mov    0x10(%ebp),%eax
  102099:	0f af 45 08          	imul   0x8(%ebp),%eax
  10209d:	29 c2                	sub    %eax,%edx
  10209f:	8d 4a 23             	lea    0x23(%edx),%ecx
  1020a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1020a5:	8d 50 01             	lea    0x1(%eax),%edx
  1020a8:	89 55 fc             	mov    %edx,-0x4(%ebp)
  1020ab:	0f b6 91 68 25 10 00 	movzbl 0x102568(%ecx),%edx
  1020b2:	88 10                	mov    %dl,(%eax)
  1020b4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1020b8:	75 c3                	jne    10207d <itoa+0x2c>
  1020ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1020be:	79 0c                	jns    1020cc <itoa+0x7b>
  1020c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1020c3:	8d 50 01             	lea    0x1(%eax),%edx
  1020c6:	89 55 fc             	mov    %edx,-0x4(%ebp)
  1020c9:	c6 00 2d             	movb   $0x2d,(%eax)
  1020cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1020cf:	8d 50 ff             	lea    -0x1(%eax),%edx
  1020d2:	89 55 fc             	mov    %edx,-0x4(%ebp)
  1020d5:	c6 00 00             	movb   $0x0,(%eax)
  1020d8:	eb 29                	jmp    102103 <itoa+0xb2>
  1020da:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1020dd:	0f b6 00             	movzbl (%eax),%eax
  1020e0:	88 45 f3             	mov    %al,-0xd(%ebp)
  1020e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1020e6:	8d 50 ff             	lea    -0x1(%eax),%edx
  1020e9:	89 55 fc             	mov    %edx,-0x4(%ebp)
  1020ec:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1020ef:	0f b6 12             	movzbl (%edx),%edx
  1020f2:	88 10                	mov    %dl,(%eax)
  1020f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1020f7:	8d 50 01             	lea    0x1(%eax),%edx
  1020fa:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1020fd:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
  102101:	88 10                	mov    %dl,(%eax)
  102103:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102106:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  102109:	72 cf                	jb     1020da <itoa+0x89>
  10210b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10210e:	c9                   	leave
  10210f:	c3                   	ret

00102110 <generic_print>:
  102110:	55                   	push   %ebp
  102111:	89 e5                	mov    %esp,%ebp
  102113:	83 ec 18             	sub    $0x18,%esp
  102116:	8b 45 0c             	mov    0xc(%ebp),%eax
  102119:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10211c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  102123:	eb 1f                	jmp    102144 <generic_print+0x34>
  102125:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102128:	8d 50 01             	lea    0x1(%eax),%edx
  10212b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10212e:	0f b6 00             	movzbl (%eax),%eax
  102131:	0f be c0             	movsbl %al,%eax
  102134:	83 ec 0c             	sub    $0xc,%esp
  102137:	50                   	push   %eax
  102138:	8b 45 08             	mov    0x8(%ebp),%eax
  10213b:	ff d0                	call   *%eax
  10213d:	83 c4 10             	add    $0x10,%esp
  102140:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  102144:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102147:	0f b6 00             	movzbl (%eax),%eax
  10214a:	84 c0                	test   %al,%al
  10214c:	75 d7                	jne    102125 <generic_print+0x15>
  10214e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102151:	c9                   	leave
  102152:	c3                   	ret

00102153 <generic_printf>:
  102153:	55                   	push   %ebp
  102154:	89 e5                	mov    %esp,%ebp
  102156:	81 ec a8 00 00 00    	sub    $0xa8,%esp
  10215c:	8d 45 10             	lea    0x10(%ebp),%eax
  10215f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102162:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102169:	8b 45 0c             	mov    0xc(%ebp),%eax
  10216c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10216f:	e9 44 01 00 00       	jmp    1022b8 <generic_printf+0x165>
  102174:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102177:	0f b6 00             	movzbl (%eax),%eax
  10217a:	3c 25                	cmp    $0x25,%al
  10217c:	0f 85 19 01 00 00    	jne    10229b <generic_printf+0x148>
  102182:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  102186:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102189:	0f b6 00             	movzbl (%eax),%eax
  10218c:	0f be c0             	movsbl %al,%eax
  10218f:	83 e8 58             	sub    $0x58,%eax
  102192:	83 f8 20             	cmp    $0x20,%eax
  102195:	0f 87 19 01 00 00    	ja     1022b4 <generic_printf+0x161>
  10219b:	8b 04 85 b0 25 10 00 	mov    0x1025b0(,%eax,4),%eax
  1021a2:	ff e0                	jmp    *%eax
  1021a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1021a7:	8d 50 04             	lea    0x4(%eax),%edx
  1021aa:	89 55 e8             	mov    %edx,-0x18(%ebp)
  1021ad:	8b 00                	mov    (%eax),%eax
  1021af:	89 c2                	mov    %eax,%edx
  1021b1:	6a 0a                	push   $0xa
  1021b3:	8d 85 66 ff ff ff    	lea    -0x9a(%ebp),%eax
  1021b9:	50                   	push   %eax
  1021ba:	52                   	push   %edx
  1021bb:	e8 91 fe ff ff       	call   102051 <itoa>
  1021c0:	83 c4 0c             	add    $0xc,%esp
  1021c3:	83 ec 08             	sub    $0x8,%esp
  1021c6:	8d 85 66 ff ff ff    	lea    -0x9a(%ebp),%eax
  1021cc:	50                   	push   %eax
  1021cd:	ff 75 08             	push   0x8(%ebp)
  1021d0:	e8 3b ff ff ff       	call   102110 <generic_print>
  1021d5:	83 c4 10             	add    $0x10,%esp
  1021d8:	01 45 f4             	add    %eax,-0xc(%ebp)
  1021db:	e9 d4 00 00 00       	jmp    1022b4 <generic_printf+0x161>
  1021e0:	c6 85 66 ff ff ff 30 	movb   $0x30,-0x9a(%ebp)
  1021e7:	c6 85 67 ff ff ff 78 	movb   $0x78,-0x99(%ebp)
  1021ee:	8d 85 66 ff ff ff    	lea    -0x9a(%ebp),%eax
  1021f4:	83 c0 02             	add    $0x2,%eax
  1021f7:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1021fa:	8d 4a 04             	lea    0x4(%edx),%ecx
  1021fd:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102200:	8b 12                	mov    (%edx),%edx
  102202:	83 ec 04             	sub    $0x4,%esp
  102205:	6a 10                	push   $0x10
  102207:	50                   	push   %eax
  102208:	52                   	push   %edx
  102209:	e8 43 fe ff ff       	call   102051 <itoa>
  10220e:	83 c4 10             	add    $0x10,%esp
  102211:	83 ec 08             	sub    $0x8,%esp
  102214:	8d 85 66 ff ff ff    	lea    -0x9a(%ebp),%eax
  10221a:	50                   	push   %eax
  10221b:	ff 75 08             	push   0x8(%ebp)
  10221e:	e8 ed fe ff ff       	call   102110 <generic_print>
  102223:	83 c4 10             	add    $0x10,%esp
  102226:	01 45 f4             	add    %eax,-0xc(%ebp)
  102229:	e9 86 00 00 00       	jmp    1022b4 <generic_printf+0x161>
  10222e:	c6 85 66 ff ff ff 30 	movb   $0x30,-0x9a(%ebp)
  102235:	c6 85 67 ff ff ff 62 	movb   $0x62,-0x99(%ebp)
  10223c:	8d 85 66 ff ff ff    	lea    -0x9a(%ebp),%eax
  102242:	83 c0 02             	add    $0x2,%eax
  102245:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102248:	8d 4a 04             	lea    0x4(%edx),%ecx
  10224b:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10224e:	8b 12                	mov    (%edx),%edx
  102250:	83 ec 04             	sub    $0x4,%esp
  102253:	6a 02                	push   $0x2
  102255:	50                   	push   %eax
  102256:	52                   	push   %edx
  102257:	e8 f5 fd ff ff       	call   102051 <itoa>
  10225c:	83 c4 10             	add    $0x10,%esp
  10225f:	83 ec 08             	sub    $0x8,%esp
  102262:	8d 85 66 ff ff ff    	lea    -0x9a(%ebp),%eax
  102268:	50                   	push   %eax
  102269:	ff 75 08             	push   0x8(%ebp)
  10226c:	e8 9f fe ff ff       	call   102110 <generic_print>
  102271:	83 c4 10             	add    $0x10,%esp
  102274:	01 45 f4             	add    %eax,-0xc(%ebp)
  102277:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10227a:	8d 50 04             	lea    0x4(%eax),%edx
  10227d:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102280:	8b 00                	mov    (%eax),%eax
  102282:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102285:	83 ec 08             	sub    $0x8,%esp
  102288:	ff 75 ec             	push   -0x14(%ebp)
  10228b:	ff 75 08             	push   0x8(%ebp)
  10228e:	e8 7d fe ff ff       	call   102110 <generic_print>
  102293:	83 c4 10             	add    $0x10,%esp
  102296:	01 45 f4             	add    %eax,-0xc(%ebp)
  102299:	eb 19                	jmp    1022b4 <generic_printf+0x161>
  10229b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10229e:	0f b6 00             	movzbl (%eax),%eax
  1022a1:	0f be c0             	movsbl %al,%eax
  1022a4:	83 ec 0c             	sub    $0xc,%esp
  1022a7:	50                   	push   %eax
  1022a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1022ab:	ff d0                	call   *%eax
  1022ad:	83 c4 10             	add    $0x10,%esp
  1022b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1022b4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  1022b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1022bb:	0f b6 00             	movzbl (%eax),%eax
  1022be:	84 c0                	test   %al,%al
  1022c0:	0f 85 ae fe ff ff    	jne    102174 <generic_printf+0x21>
  1022c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1022c9:	c9                   	leave
  1022ca:	c3                   	ret
  1022cb:	90                   	nop
  1022cc:	68 69 2c 20 77       	push   $0x77202c69
  1022d1:	65 20 69 6e          	and    %ch,%gs:0x6e(%ecx)
  1022d5:	20 6b 65             	and    %ch,0x65(%ebx)
  1022d8:	72 6e                	jb     102348 <generic_printf+0x1f5>
  1022da:	65 6c                	gs insb (%dx),%es:(%edi)
  1022dc:	2e 0d 0a 00 77 61    	cs or  $0x6177000a,%eax
  1022e2:	73 75                	jae    102359 <generic_printf+0x206>
  1022e4:	70 3f                	jo     102325 <generic_printf+0x1d2>
  1022e6:	00 68 65             	add    %ch,0x65(%eax)
  1022e9:	6c                   	insb   (%dx),%es:(%edi)
  1022ea:	6c                   	insb   (%dx),%es:(%edi)
  1022eb:	6f                   	outsl  %ds:(%esi),(%dx)
  1022ec:	2c 20                	sub    $0x20,%al
  1022ee:	77 6f                	ja     10235f <generic_printf+0x20c>
  1022f0:	72 6c                	jb     10235e <generic_printf+0x20b>
  1022f2:	64 00 74 68 69       	add    %dh,%fs:0x69(%eax,%ebp,2)
  1022f7:	73 20                	jae    102319 <generic_printf+0x1c6>
  1022f9:	62 75 66             	bound  %esi,0x66(%ebp)
  1022fc:	66 65 72 3d          	data16 gs jb 10233d <generic_printf+0x1ea>
  102300:	3e 20 25 73 20 3c 3d 	and    %ah,%ds:0x3d3c2073
  102307:	20 77 61             	and    %dh,0x61(%edi)
  10230a:	73 20                	jae    10232c <generic_printf+0x1d9>
  10230c:	61                   	popa
  10230d:	6c                   	insb   (%dx),%es:(%edi)
  10230e:	6c                   	insb   (%dx),%es:(%edi)
  10230f:	6f                   	outsl  %ds:(%esi),(%dx)
  102310:	63 61 74             	arpl   %sp,0x74(%ecx)
  102313:	65 64 20 75 73       	gs and %dh,%fs:0x73(%ebp)
  102318:	69 6e 67 20 70 6d 6d 	imul   $0x6d6d7020,0x67(%esi),%ebp
  10231f:	5f                   	pop    %edi
  102320:	61                   	popa
  102321:	6c                   	insb   (%dx),%es:(%edi)
  102322:	6c                   	insb   (%dx),%es:(%edi)
  102323:	6f                   	outsl  %ds:(%esi),(%dx)
  102324:	63 28                	arpl   %bp,(%eax)
  102326:	29 2e                	sub    %ebp,(%esi)
  102328:	0a 00                	or     (%eax),%al
  10232a:	6a 2e                	push   $0x2e
  10232c:	61                   	popa
  10232d:	73 5f                	jae    10238e <generic_printf+0x23b>
  10232f:	75 33                	jne    102364 <generic_printf+0x211>
  102331:	32 20                	xor    (%eax),%ah
  102333:	3d 20 25 78 0a       	cmp    $0xa782520,%eax
  102338:	00 00                	add    %al,(%eax)
  10233a:	00 00                	add    %al,(%eax)
  10233c:	30 78 64             	xor    %bh,0x64(%eax)
  10233f:	65 61                	gs popa
  102341:	64 62 30             	bound  %esi,%fs:(%eax)
  102344:	30 62 28             	xor    %ah,0x28(%edx)
  102347:	70 64                	jo     1023ad <generic_printf+0x25a>
  102349:	2c 20                	sub    $0x20,%al
  10234b:	70 74                	jo     1023c1 <generic_printf+0x26e>
  10234d:	2c 20                	sub    $0x20,%al
  10234f:	6f                   	outsl  %ds:(%esi),(%dx)
  102350:	29 20                	sub    %esp,(%eax)
  102352:	3d 20 28 25 78       	cmp    $0x78252820,%eax
  102357:	2c 20                	sub    $0x20,%al
  102359:	25 78 2c 20 25       	and    $0x25202c78,%eax
  10235e:	78 29                	js     102389 <generic_printf+0x236>
  102360:	0a 00                	or     (%eax),%al
  102362:	00 00                	add    %al,(%eax)
  102364:	72 65                	jb     1023cb <generic_printf+0x278>
  102366:	63 6f 6e             	arpl   %bp,0x6e(%edi)
  102369:	73 74                	jae    1023df <generic_printf+0x28c>
  10236b:	72 75                	jb     1023e2 <generic_printf+0x28f>
  10236d:	63 74 69 6e          	arpl   %si,0x6e(%ecx,%ebp,2)
  102371:	67 20 30             	and    %dh,(%bx,%si)
  102374:	78 64                	js     1023da <generic_printf+0x287>
  102376:	65 61                	gs popa
  102378:	64 62 30             	bound  %esi,%fs:(%eax)
  10237b:	30 62 3a             	xor    %ah,0x3a(%edx)
  10237e:	20 25 78 0a 00 90    	and    %ah,0x90000a78
  102384:	70 6d                	jo     1023f3 <generic_printf+0x2a0>
  102386:	6d                   	insl   (%dx),%es:(%edi)
  102387:	5f                   	pop    %edi
  102388:	69 6e 69 74 28 29 3a 	imul   $0x3a292874,0x69(%esi),%ebp
  10238f:	20 73 74             	and    %dh,0x74(%ebx)
  102392:	61                   	popa
  102393:	72 74                	jb     102409 <generic_printf+0x2b6>
  102395:	3d 25 78 20 69       	cmp    $0x69207825,%eax
  10239a:	73 20                	jae    1023bc <generic_printf+0x269>
  10239c:	6e                   	outsb  %ds:(%esi),(%dx)
  10239d:	6f                   	outsl  %ds:(%esi),(%dx)
  10239e:	74 20                	je     1023c0 <generic_printf+0x26d>
  1023a0:	70 61                	jo     102403 <generic_printf+0x2b0>
  1023a2:	67 65 2d 61 6c 69 67 	addr16 gs sub $0x67696c61,%eax
  1023a9:	6e                   	outsb  %ds:(%esi),(%dx)
  1023aa:	65 64 2e 0a 00       	gs fs or %cs:(%eax),%al
  1023af:	00 70 6d             	add    %dh,0x6d(%eax)
  1023b2:	6d                   	insl   (%dx),%es:(%edi)
  1023b3:	5f                   	pop    %edi
  1023b4:	69 6e 69 74 28 29 3a 	imul   $0x3a292874,0x69(%esi),%ebp
  1023bb:	20 69 6e             	and    %ch,0x6e(%ecx)
  1023be:	69 74 69 61 6c 69 7a 	imul   $0x657a696c,0x61(%ecx,%ebp,2),%esi
  1023c5:	65 
  1023c6:	64 20 70 6d          	and    %dh,%fs:0x6d(%eax)
  1023ca:	6d                   	insl   (%dx),%es:(%edi)
  1023cb:	20 77 69             	and    %dh,0x69(%edi)
  1023ce:	74 68                	je     102438 <generic_printf+0x2e5>
  1023d0:	20 73 74             	and    %dh,0x74(%ebx)
  1023d3:	61                   	popa
  1023d4:	72 74                	jb     10244a <generic_printf+0x2f7>
  1023d6:	3d 25 78 2c 20       	cmp    $0x202c7825,%eax
  1023db:	65 6e                	outsb  %gs:(%esi),(%dx)
  1023dd:	64 20 3d 20 25 78 2c 	and    %bh,%fs:0x2c782520
  1023e4:	20 66 72             	and    %ah,0x72(%esi)
  1023e7:	65 65 5f             	gs gs pop %edi
  1023ea:	70 61                	jo     10244d <generic_printf+0x2fa>
  1023ec:	67 65 73 20          	addr16 gs jae 102410 <generic_printf+0x2bd>
  1023f0:	3d 20 25 64 0a       	cmp    $0xa642520,%eax
  1023f5:	00 00                	add    %al,(%eax)
  1023f7:	00 70 6d             	add    %dh,0x6d(%eax)
  1023fa:	6d                   	insl   (%dx),%es:(%edi)
  1023fb:	5f                   	pop    %edi
  1023fc:	61                   	popa
  1023fd:	6c                   	insb   (%dx),%es:(%edi)
  1023fe:	6c                   	insb   (%dx),%es:(%edi)
  1023ff:	6f                   	outsl  %ds:(%esi),(%dx)
  102400:	63 28                	arpl   %bp,(%eax)
  102402:	29 3a                	sub    %edi,(%edx)
  102404:	20 66 72             	and    %ah,0x72(%esi)
  102407:	65 65 5f             	gs gs pop %edi
  10240a:	70 61                	jo     10246d <generic_printf+0x31a>
  10240c:	67 65 73 20          	addr16 gs jae 102430 <generic_printf+0x2dd>
  102410:	3d 20 25 64 2c       	cmp    $0x2c642520,%eax
  102415:	20 61 6c             	and    %ah,0x6c(%ecx)
  102418:	6c                   	insb   (%dx),%es:(%edi)
  102419:	6f                   	outsl  %ds:(%esi),(%dx)
  10241a:	63 61 74             	arpl   %sp,0x74(%ecx)
  10241d:	65 64 5f             	gs fs pop %edi
  102420:	70 61                	jo     102483 <generic_printf+0x330>
  102422:	67 65 73 20          	addr16 gs jae 102446 <generic_printf+0x2f3>
  102426:	3d 20 25 64 20       	cmp    $0x20642520,%eax
  10242b:	00 4f 4f             	add    %cl,0x4f(%edi)
  10242e:	4d                   	dec    %ebp
  10242f:	00 70 6d             	add    %dh,0x6d(%eax)
  102432:	6d                   	insl   (%dx),%es:(%edi)
  102433:	5f                   	pop    %edi
  102434:	61                   	popa
  102435:	6c                   	insb   (%dx),%es:(%edi)
  102436:	6c                   	insb   (%dx),%es:(%edi)
  102437:	6f                   	outsl  %ds:(%esi),(%dx)
  102438:	63 28                	arpl   %bp,(%eax)
  10243a:	29 3a                	sub    %edi,(%edx)
  10243c:	20 72 65             	and    %dh,0x65(%edx)
  10243f:	74 75                	je     1024b6 <generic_printf+0x363>
  102441:	72 6e                	jb     1024b1 <generic_printf+0x35e>
  102443:	69 6e 67 20 25 78 0a 	imul   $0xa782520,0x67(%esi),%ebp
  10244a:	00 00                	add    %al,(%eax)
  10244c:	70 6d                	jo     1024bb <generic_printf+0x368>
  10244e:	6d                   	insl   (%dx),%es:(%edi)
  10244f:	5f                   	pop    %edi
  102450:	66 72 65             	data16 jb 1024b8 <generic_printf+0x365>
  102453:	65 28 29             	sub    %ch,%gs:(%ecx)
  102456:	3a 20                	cmp    (%eax),%ah
  102458:	66 72 65             	data16 jb 1024c0 <generic_printf+0x36d>
  10245b:	65 5f                	gs pop %edi
  10245d:	70 61                	jo     1024c0 <generic_printf+0x36d>
  10245f:	67 65 73 20          	addr16 gs jae 102483 <generic_printf+0x330>
  102463:	3d 20 25 64 2c       	cmp    $0x2c642520,%eax
  102468:	20 61 6c             	and    %ah,0x6c(%ecx)
  10246b:	6c                   	insb   (%dx),%es:(%edi)
  10246c:	6f                   	outsl  %ds:(%esi),(%dx)
  10246d:	63 61 74             	arpl   %sp,0x74(%ecx)
  102470:	65 64 5f             	gs fs pop %edi
  102473:	70 61                	jo     1024d6 <generic_printf+0x383>
  102475:	67 65 73 20          	addr16 gs jae 102499 <generic_printf+0x346>
  102479:	3d 20 25 64 20       	cmp    $0x20642520,%eax
  10247e:	00 70 6d             	add    %dh,0x6d(%eax)
  102481:	6d                   	insl   (%dx),%es:(%edi)
  102482:	5f                   	pop    %edi
  102483:	66 72 65             	data16 jb 1024eb <generic_printf+0x398>
  102486:	65 28 29             	sub    %ch,%gs:(%ecx)
  102489:	3a 20                	cmp    (%eax),%ah
  10248b:	66 72 65             	data16 jb 1024f3 <generic_printf+0x3a0>
  10248e:	65 69 6e 67 20 25 78 	imul   $0xa782520,%gs:0x67(%esi),%ebp
  102495:	0a 
  102496:	00 00                	add    %al,(%eax)
  102498:	76 6d                	jbe    102507 <generic_printf+0x3b4>
  10249a:	6d                   	insl   (%dx),%es:(%edi)
  10249b:	5f                   	pop    %edi
  10249c:	6d                   	insl   (%dx),%es:(%edi)
  10249d:	61                   	popa
  10249e:	70 28                	jo     1024c8 <generic_printf+0x375>
  1024a0:	29 3a                	sub    %edi,(%edx)
  1024a2:	20 6d 61             	and    %ch,0x61(%ebp)
  1024a5:	70 70                	jo     102517 <generic_printf+0x3c4>
  1024a7:	69 6e 67 20 72 61 6e 	imul   $0x6e617220,0x67(%esi),%ebp
  1024ae:	67 65 20 70 68       	and    %dh,%gs:0x68(%bx,%si)
  1024b3:	79 73                	jns    102528 <generic_printf+0x3d5>
  1024b5:	5b                   	pop    %ebx
  1024b6:	25 78 3a 25 78       	and    $0x78253a78,%eax
  1024bb:	5d                   	pop    %ebp
  1024bc:	20 74 6f 20          	and    %dh,0x20(%edi,%ebp,2)
  1024c0:	76 69                	jbe    10252b <generic_printf+0x3d8>
  1024c2:	72 74                	jb     102538 <generic_printf+0x3e5>
  1024c4:	5b                   	pop    %ebx
  1024c5:	25 78 3a 25 78       	and    $0x78253a78,%eax
  1024ca:	5d                   	pop    %ebp
  1024cb:	0a 00                	or     (%eax),%al
  1024cd:	72 65                	jb     102534 <generic_printf+0x3e1>
  1024cf:	6d                   	insl   (%dx),%es:(%edi)
  1024d0:	61                   	popa
  1024d1:	70 00                	jo     1024d3 <generic_printf+0x380>
  1024d3:	44                   	inc    %esp
  1024d4:	49                   	dec    %ecx
  1024d5:	52                   	push   %edx
  1024d6:	20 25 78 0a 00 2e    	and    %ah,0x2e000a78
  1024dc:	2e 2e 20 54 42 4c    	cs and %dl,%cs:0x4c(%edx,%eax,2)
  1024e2:	20 25 64 28 25 78    	and    %ah,0x78252864
  1024e8:	29 0a                	sub    %ecx,(%edx)
  1024ea:	00 2e                	add    %ch,(%esi)
  1024ec:	2e 2e 20 2e          	cs and %ch,%cs:(%esi)
  1024f0:	2e 2e 20 50 54       	cs and %dl,%cs:0x54(%eax)
  1024f5:	45                   	inc    %ebp
  1024f6:	20 25 64 28 25 78    	and    %ah,0x78252864
  1024fc:	29 00                	sub    %eax,(%eax)
  1024fe:	00 00                	add    %al,(%eax)
  102500:	41                   	inc    %ecx
  102501:	44                   	inc    %esp
  102502:	44                   	inc    %esp
  102503:	52                   	push   %edx
  102504:	3d 25 78 2c 20       	cmp    $0x202c7825,%eax
  102509:	70 68                	jo     102573 <generic_printf+0x420>
  10250b:	79 73                	jns    102580 <generic_printf+0x42d>
  10250d:	28 25 78 29 20 3d    	sub    %ah,0x3d202978
  102513:	3e 20 76 69          	and    %dh,%ds:0x69(%esi)
  102517:	72 74                	jb     10258d <generic_printf+0x43a>
  102519:	28 25 78 29 0a 00    	sub    %ah,0xa2978
  10251f:	66 61                	popaw
  102521:	75 6c                	jne    10258f <generic_printf+0x43c>
  102523:	74 20                	je     102545 <generic_printf+0x3f2>
  102525:	3a 20                	cmp    (%eax),%ah
  102527:	74 72                	je     10259b <generic_printf+0x448>
  102529:	61                   	popa
  10252a:	70 66                	jo     102592 <generic_printf+0x43f>
  10252c:	72 61                	jb     10258f <generic_printf+0x43c>
  10252e:	6d                   	insl   (%dx),%es:(%edi)
  10252f:	65 3a 20             	cmp    %gs:(%eax),%ah
  102532:	0a 00                	or     (%eax),%al
  102534:	2e 2e 2e 20 74 72 61 	cs cs and %dh,%cs:0x61(%edx,%esi,2)
  10253b:	70 6e                	jo     1025ab <generic_printf+0x458>
  10253d:	6f                   	outsl  %ds:(%esi),(%dx)
  10253e:	20 3d 20 25 78 3a    	and    %bh,0x3a782520
  102544:	20 0a                	and    %cl,(%edx)
  102546:	00 2e                	add    %ch,(%esi)
  102548:	2e 2e 20 65 72       	cs and %ah,%cs:0x72(%ebp)
  10254d:	72 63                	jb     1025b2 <generic_printf+0x45f>
  10254f:	6f                   	outsl  %ds:(%esi),(%dx)
  102550:	64 65 20 3d 20 25 78 	fs and %bh,%gs:0x3a782520
  102557:	3a 
  102558:	20 0a                	and    %cl,(%edx)
  10255a:	00 2e                	add    %ch,(%esi)
  10255c:	2e 2e 43             	cs cs inc %ebx
  10255f:	72 32                	jb     102593 <generic_printf+0x440>
  102561:	20 3d 20 25 78 0a    	and    %bh,0xa782520
  102567:	00 7a 79             	add    %bh,0x79(%edx)
  10256a:	78 77                	js     1025e3 <generic_printf+0x490>
  10256c:	76 75                	jbe    1025e3 <generic_printf+0x490>
  10256e:	74 73                	je     1025e3 <generic_printf+0x490>
  102570:	72 71                	jb     1025e3 <generic_printf+0x490>
  102572:	70 6f                	jo     1025e3 <generic_printf+0x490>
  102574:	6e                   	outsb  %ds:(%esi),(%dx)
  102575:	6d                   	insl   (%dx),%es:(%edi)
  102576:	6c                   	insb   (%dx),%es:(%edi)
  102577:	6b 6a 69 68          	imul   $0x68,0x69(%edx),%ebp
  10257b:	67 66 65 64 63 62 61 	data16 gs arpl %sp,%fs:0x61(%bp,%si)
  102582:	39 38                	cmp    %edi,(%eax)
  102584:	37                   	aaa
  102585:	36 35 34 33 32 31    	ss xor $0x31323334,%eax
  10258b:	30 31                	xor    %dh,(%ecx)
  10258d:	32 33                	xor    (%ebx),%dh
  10258f:	34 35                	xor    $0x35,%al
  102591:	36 37                	ss aaa
  102593:	38 39                	cmp    %bh,(%ecx)
  102595:	61                   	popa
  102596:	62 63 64             	bound  %esp,0x64(%ebx)
  102599:	65 66 67 68 69 6a    	gs addr16 pushw $0x6a69
  10259f:	6b 6c 6d 6e 6f       	imul   $0x6f,0x6e(%ebp,%ebp,2),%ebp
  1025a4:	70 71                	jo     102617 <generic_printf+0x4c4>
  1025a6:	72 73                	jb     10261b <generic_printf+0x4c8>
  1025a8:	74 75                	je     10261f <generic_printf+0x4cc>
  1025aa:	76 77                	jbe    102623 <generic_printf+0x4d0>
  1025ac:	78 79                	js     102627 <generic_printf+0x4d4>
  1025ae:	7a 00                	jp     1025b0 <generic_printf+0x45d>
  1025b0:	e0 21                	loopne 1025d3 <generic_printf+0x480>
  1025b2:	10 00                	adc    %al,(%eax)
  1025b4:	b4 22                	mov    $0x22,%ah
  1025b6:	10 00                	adc    %al,(%eax)
  1025b8:	b4 22                	mov    $0x22,%ah
  1025ba:	10 00                	adc    %al,(%eax)
  1025bc:	b4 22                	mov    $0x22,%ah
  1025be:	10 00                	adc    %al,(%eax)
  1025c0:	b4 22                	mov    $0x22,%ah
  1025c2:	10 00                	adc    %al,(%eax)
  1025c4:	b4 22                	mov    $0x22,%ah
  1025c6:	10 00                	adc    %al,(%eax)
  1025c8:	b4 22                	mov    $0x22,%ah
  1025ca:	10 00                	adc    %al,(%eax)
  1025cc:	b4 22                	mov    $0x22,%ah
  1025ce:	10 00                	adc    %al,(%eax)
  1025d0:	b4 22                	mov    $0x22,%ah
  1025d2:	10 00                	adc    %al,(%eax)
  1025d4:	b4 22                	mov    $0x22,%ah
  1025d6:	10 00                	adc    %al,(%eax)
  1025d8:	2e 22 10             	and    %cs:(%eax),%dl
  1025db:	00 b4 22 10 00 a4 21 	add    %dh,0x21a40010(%edx,%eiz,1)
  1025e2:	10 00                	adc    %al,(%eax)
  1025e4:	b4 22                	mov    $0x22,%ah
  1025e6:	10 00                	adc    %al,(%eax)
  1025e8:	b4 22                	mov    $0x22,%ah
  1025ea:	10 00                	adc    %al,(%eax)
  1025ec:	b4 22                	mov    $0x22,%ah
  1025ee:	10 00                	adc    %al,(%eax)
  1025f0:	b4 22                	mov    $0x22,%ah
  1025f2:	10 00                	adc    %al,(%eax)
  1025f4:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  1025f5:	21 10                	and    %edx,(%eax)
  1025f7:	00 b4 22 10 00 b4 22 	add    %dh,0x22b40010(%edx,%eiz,1)
  1025fe:	10 00                	adc    %al,(%eax)
  102600:	b4 22                	mov    $0x22,%ah
  102602:	10 00                	adc    %al,(%eax)
  102604:	b4 22                	mov    $0x22,%ah
  102606:	10 00                	adc    %al,(%eax)
  102608:	b4 22                	mov    $0x22,%ah
  10260a:	10 00                	adc    %al,(%eax)
  10260c:	b4 22                	mov    $0x22,%ah
  10260e:	10 00                	adc    %al,(%eax)
  102610:	b4 22                	mov    $0x22,%ah
  102612:	10 00                	adc    %al,(%eax)
  102614:	b4 22                	mov    $0x22,%ah
  102616:	10 00                	adc    %al,(%eax)
  102618:	b4 22                	mov    $0x22,%ah
  10261a:	10 00                	adc    %al,(%eax)
  10261c:	77 22                	ja     102640 <kernel_text_end+0xc>
  10261e:	10 00                	adc    %al,(%eax)
  102620:	b4 22                	mov    $0x22,%ah
  102622:	10 00                	adc    %al,(%eax)
  102624:	b4 22                	mov    $0x22,%ah
  102626:	10 00                	adc    %al,(%eax)
  102628:	b4 22                	mov    $0x22,%ah
  10262a:	10 00                	adc    %al,(%eax)
  10262c:	b4 22                	mov    $0x22,%ah
  10262e:	10 00                	adc    %al,(%eax)
  102630:	e0 21                	loopne 102653 <kernel_text_end+0x1f>
  102632:	10 00                	adc    %al,(%eax)
