
var (varStatusCode, varStatusMessage) = httpError404
varStatusCode
varStatusMessage

// Access tuple values with the dot operator followed by their index:
httpError404.0
httpError404.1

// Alternatively, you can name the elements of a Tuple
let namedTuple = (statusCode: 404, message: "Not found")

// When you name the elements you effectively assign names to their indices, so the dot operator works with names or integers:
namedTuple.statusCode == namedTuple.0
namedTuple.message == namedTuple.1

