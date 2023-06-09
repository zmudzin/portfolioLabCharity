package pl.revida.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.revida.charity.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {


}