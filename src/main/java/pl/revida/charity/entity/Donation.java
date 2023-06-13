package pl.revida.charity.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
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
    @Positive
    @NotNull
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
    @NotBlank(message = "uzupełnij Ulicę")
    private String street;
    @NotBlank(message = "uzupełnij Miasto")
    private String city;
    @NotBlank(message = "uzupełnij kod pocztowy")
    private String zipCode;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Future(message = "musi być przyszła data")
    @NotNull(message = "uzupełnij datę odbioru")
    private LocalDate pickUpDate;
    @NotNull(message = "uzupełnij godzinę odbioru")
    private LocalTime pickUpTime;
    @Length(max = 250)
    private String pickUpComment;
    @NotNull
    private boolean collected = false;
    @ManyToOne
    private User user;
}
