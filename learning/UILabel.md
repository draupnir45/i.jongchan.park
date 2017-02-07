#`UILabel`

- `@property(nonatomic)        NSLineBreakMode    lineBreakMode;` : default is NSLineBreakByTruncatingTail. used for single and multiple lines of text.
- the 'highlight' property is used by subclasses for such things as pressed states. it's useful to make it part of the base class as a user property `@property(nullable, nonatomic,strong)               UIColor *highlightedTextColor; // default is nil` 
`@property(nonatomic,getter=isHighlighted) BOOL     highlighted;// default is NO`          
- `@property(nonatomic) BOOL adjustsFontSizeToFitWidth;         // default is NO`