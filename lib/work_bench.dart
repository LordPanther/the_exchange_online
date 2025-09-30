return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Create your store", style: FONT_CONST.BOLD_BLACK_28),
          SizedBox(height: 24),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Store Name"),
            validator: (v) => v == null || v.isEmpty ? "Enter a name" : null,
          ),
          SizedBox(height: SizeConfig.defaultSize * 1.6),
          TextFormField(
            controller: _descController,
            decoration: InputDecoration(labelText: "Description"),
            validator: (v) =>
                v == null || v.isEmpty ? "Enter a description" : null,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final shop = ShopModel(
                  id: UniqueKey().toString(),
                  name: _nameController.text,
                  description: _descController.text,
                  tenant: null,
                  email: null,
                  phoneNumber: null,
                  isActive: true,
                  createdAt: DateTime.now().toIso8601String(),
                  updatedAt: DateTime.now().toIso8601String(),
                );
                onCreateShop(shop);
              }
            },
            child: Text("Create Store"),
          ),
        ],
      ),
    );