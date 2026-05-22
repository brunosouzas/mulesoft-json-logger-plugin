%dw 2.0
import * from dw::Runtime

fun stringifyAny(inputData: Any) = try(() -> if (inputData.^mimeType == "application/xml" or
									   inputData.^mimeType == "application/dw" or
									   inputData.^mimeType == "application/json") 
									write(inputData,inputData.^mimeType,{indent:false}) 
								   else if (inputData.^mimeType == "*/*")
								    inputData
								   else
						   	write(inputData,inputData.^mimeType)) orElse "JSON logger internal error"
						   	
fun stringifyNonJSON(inputData: Any) = try(() -> if (inputData.^mimeType == "application/xml" or
										   inputData.^mimeType == "application/dw") 
										 write(inputData,inputData.^mimeType,{indent:false}) 
									   else if (inputData.^mimeType == "application/json" or inputData.^mimeType == "*/*")
									   	 inputData
									   else
							   			 write(inputData,inputData.^mimeType)) orElse "JSON logger internal error"

fun stringifyAnyWithMetadata(inputData: Any) = try(() -> { 
												 data: if (inputData.^mimeType == "application/xml" or
														   inputData.^mimeType == "application/dw" or
														   inputData.^mimeType == "application/json")
														 write(inputData,inputData.^mimeType,{indent:false})
                                                       else if (inputData.^mimeType == "*/*")
                                                        inputData
													   else
													     write(inputData,inputData.^mimeType),													
												 (contentLength: inputData.^contentLength) if (inputData.^contentLength != null),
												 (dataType: inputData.^mimeType) if (inputData.^mimeType != null),
												 (class: inputData.^class) if (inputData.^class != null)
											   } ) orElse "JSON logger internal error"

fun stringifyNonJSONWithMetadata(inputData: Any) = try(() -> { 
												 data: if (inputData.^mimeType == "application/xml" or
														   inputData.^mimeType == "application/dw")
														 write(inputData,inputData.^mimeType,{indent:false})
													   else if (inputData.^mimeType == "application/json" or inputData.^mimeType == "*/*")
													   	 inputData
													   else
													     write(inputData,inputData.^mimeType),													
												 (contentLength: inputData.^contentLength) if (inputData.^contentLength != null),
												 (dataType: inputData.^mimeType) if (inputData.^mimeType != null),
												 (class: inputData.^class) if (inputData.^class != null)
											   } ) orElse "JSON logger internal error"