package pl.coderslab.charity.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "donations")
@Getter
@Setter
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Min(value = 1)
    private Integer quantity;
    @NotEmpty(message = "Wybierz co chcesz oddać.")
    @ManyToMany
    @JoinTable(
            name = "donations_categories",
            joinColumns = @JoinColumn(name = "donation_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id")
    )
    private Set<Category> categories = new HashSet<>();
    @ManyToOne
    @NotNull(message = "Wybierz fundację, której chcesz pomóc.")
    private Institution institution;
    @NotEmpty(message = "uzupełnij Ulicę")
    @NotNull(message = "uzupełnij Ulicę")
    private String street;
    @NotEmpty(message = "uzupełnij Miasto")
    @NotNull(message = "uzupełnij Miasto")
    private String city;
    @NotEmpty(message = "uzupełnij kod pocztowy")
    @NotNull(message = "uzupełnij kod pocztowy")
    private String zipCode;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message = "uzupełnij datę odbioru")
    private LocalDate pickUpDate ;
    @NotNull(message = "uzupełnij godzinę odbioru")
    private LocalTime pickUpTime ;
    private String pickUpComment;
}
