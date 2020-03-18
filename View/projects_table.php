<table border="1" cellpadding="20">
    <tr>
        <th>Name</th>
        <th>URL</th>
        <th>Budget</th>
        <th>Employer Name</th>
        <th>Employer Login</th>
    </tr>
    <?php
    foreach ($data['projects'] as $project) :?>

        <tr>
            <td><?= $project['name'] ?></td>
            <td><a target="_blank" href="<?= "{$project['url']}" ?>"><?= $project['url'] ?></a></td>
            <td><?= "{$project['amount']} {$project['currency']}" ?></td>
            <td><?= $project['employer_name'] ?></td>
            <td><?= $project['employer_login'] ?></td>
        </tr>

    <?php endforeach; ?>
</table>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="JS/projects.js"></script>
<script type="text/javascript">pagination(<?= $data['pages']?>, <?=($data['page'] + 1)?>);</script>
