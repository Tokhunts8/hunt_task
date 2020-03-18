<table border="1" cellpadding="20">
    <tr>
        <th>Skill</th>
        <th>Count</th>
    </tr>
    <?php
    foreach ($data as $skill) :?>

        <tr>
            <td><?= $skill['skill'] ?></td>
            <td><?= $skill['count'] ?></td>
        </tr>

    <?php endforeach; ?>
</table>