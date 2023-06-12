package pl.revida.charity.service;

import org.springframework.stereotype.Service;
import pl.revida.charity.entity.Category;
import pl.revida.charity.repository.CategoryRepository;

import java.util.List;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }
    public Category findById(long id){return categoryRepository.findById(id);}

    public Category createCategory(Category category){return categoryRepository.save(category);}
    public void deleteCategory(Category category){categoryRepository.delete(category);}
}