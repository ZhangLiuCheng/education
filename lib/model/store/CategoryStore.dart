import 'package:education/model/bean/Category.dart';
import 'package:education/model/http/Api.dart';
import 'package:flutter/widgets.dart';

class CategoryStore extends ValueNotifier<List<Category>> {
    
    var error;
    
    CategoryStore(value) : super(value);
    
    init() async {
        this.error = null;
        try {
            List<Category> list = await Api.categoryList();
            this.value = list;
            return list;
        } catch (error) {
            this.value = null;
            this.error = error;
            return error;
        }
    }

    @override
    void addListener(listener) {
        super.addListener(listener);
        listener();
    }
}