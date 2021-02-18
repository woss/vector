package metadata

remap: errors: "650": {
	title: "Chained comparison operators"

	description: """
		You've chained multiple comparison operators together in a way that can't result in a valid expression.
		"""

	rationale: """
		Comparison operators can only operate on two operands, e.g. `1 != 2`. Chaining them together, as in
		`1 != 2 != 3`, produces a meaningless non-expression.
		"""

	resolution: """
		Use comparison operators only on a left-hand- and a right-hand-side value.
		"""

	examples: [
		{
			"title": "\(title)"
			source: #"""
				1 == 1 == 1
				"""#
			raises: compiletime: #"""
				error: \#(title)
				┌─ :1:8
				│
				1 │ 1 == 1 == 2
				│        ^^
				│
				"""#
			diff: #"""
				- 	1 == 1 == 1
				+# 	1 == 1
				"""#
		},
	]
}
