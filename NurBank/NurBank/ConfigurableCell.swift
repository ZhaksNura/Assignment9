protocol ConfigurableCell {
    associatedtype DataType
    func configure(with data: DataType)
}
