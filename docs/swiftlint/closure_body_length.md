# Closure Body Length

Closure bodies should not span too many lines.

* **Identifier:** closure_body_length
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** metrics
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 4.2.0
* **Default configuration:** warning: 20, error: 100

## Non Triggering Examples

```swift
foo.bar { $0 }
```

```swift
foo.bar { toto in
}
```

```swift
foo.bar { toto in
	let a0 = 0
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	
	
	
	
	
	
	
	
	
	
}
```

```swift
foo.bar { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
}
```

```swift
foo.bar { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	
	
	
	
	
	
	
	
	
	
}
```

```swift
foo.bar({ toto in
})
```

```swift
foo.bar({ toto in
	let a0 = 0
})
```

```swift
foo.bar({ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
})
```

```swift
foo.bar(label: { toto in
})
```

```swift
foo.bar(label: { toto in
	let a0 = 0
})
```

```swift
foo.bar(label: { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
})
```

```swift
foo.bar(label: { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
}, anotherLabel: { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
})
```

```swift
foo.bar(label: { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
}) { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
}
```

```swift
let foo: Bar = { toto in
	let bar = Bar()
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	return bar
}()
```

## Triggering Examples

```swift
foo.bar ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
}
```

```swift
foo.bar ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	
	
	
	
	
	
	
	
	
	
}
```

```swift
foo.bar(↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
})
```

```swift
foo.bar(label: ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
})
```

```swift
foo.bar(label: ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
}, anotherLabel: ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
})
```

```swift
foo.bar(label: ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
}) ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
}
```

```swift
let foo: Bar = ↓{ toto in
	let bar = Bar()
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	return bar
}()
```